import { readdir, readFile, stat } from 'node:fs/promises'
import { join, resolve, isAbsolute } from 'node:path'

// `corefn.modulePath` is written by spago/purs-ide as a path relative to
// the *workspace root* (where the compiler was invoked).  When yoga-stories
// runs from a sub-directory (e.g. `npm/`) it would otherwise try to read
// the path relative to `process.cwd()` and fail.  `sourcesRoot` (config
// option, default `.`) is prepended before reading.  Absolute paths in
// modulePath are passed through unchanged.
const resolveSource = (config, modulePath) =>
  isAbsolute(modulePath) ? modulePath : resolve(config.sourcesRoot ?? '.', modulePath)

/**
 * Match a dot-separated module name against a dot-separated glob pattern.
 * `*` matches exactly one segment, `**` matches zero or more segments.
 */
export function matchModuleGlob(pattern, moduleName) {
  return matchSegments(pattern.split('.'), moduleName.split('.'))
}

function matchSegments(pats, mods) {
  if (pats.length === 0 && mods.length === 0) return true
  if (pats.length > 0 && pats[0] === '**' && mods.length === 0)
    return matchSegments(pats.slice(1), mods)
  if (pats.length > 0 && pats[0] === '**')
    return matchSegments(pats.slice(1), mods) || matchSegments(pats, mods.slice(1))
  if (pats.length > 0 && pats[0] === '*' && mods.length > 0)
    return matchSegments(pats.slice(1), mods.slice(1))
  if (pats.length > 0 && mods.length > 0 && pats[0] === mods[0])
    return matchSegments(pats.slice(1), mods.slice(1))
  return false
}

export function filterModules(config, modules) {
  const matchesAny = (patterns, name) => patterns.some(p => matchModuleGlob(p, name))
  return modules
    .filter(m => matchesAny(config.include, m))
    .filter(m => !matchesAny(config.exclude, m))
}

export async function listOutputModules(outputDir) {
  const entries = await readdir(outputDir)
  const results = []
  for (const entry of entries) {
    try {
      await stat(join(outputDir, entry, 'index.js'))
      results.push(entry)
    } catch {
      // not a module dir
    }
  }
  return results
}

async function readComponentSource(config, moduleName) {
  const componentModule = moduleName.replace(/\.Stories$/, '')
  if (componentModule === moduleName) return null
  const componentDir = componentModule.replace(/\./g, '.')
  try {
    const corefnPath = join(config.outputDir, componentDir, 'corefn.json')
    const corefn = JSON.parse(await readFile(corefnPath, 'utf-8'))
    return await readFile(resolveSource(config, corefn.modulePath), 'utf-8')
  } catch {
    return null
  }
}

export async function discoverStories(config) {
  const allModules = await listOutputModules(config.outputDir)
  const matched = filterModules(config, allModules)
  const stories = []
  for (const mod of matched) {
    try {
      const corefnPath = join(config.outputDir, mod, 'corefn.json')
      const corefn = JSON.parse(await readFile(corefnPath, 'utf-8'))
      const moduleName = corefn.moduleName.join('.')
      const sourcePath = resolveSource(config, corefn.modulePath)
      const sourceCode = await readFile(sourcePath, 'utf-8')
      const componentSourceCode = await readComponentSource(config, moduleName)
      stories.push({ moduleName, sourcePath, exports: corefn.exports, sourceCode, componentSourceCode })
    } catch {
      // skip modules with missing/broken corefn.json
    }
  }
  return stories
}

export async function loadConfig(configPath) {
  try {
    return JSON.parse(await readFile(configPath, 'utf-8'))
  } catch {
    return { outputDir: './output', sourcesRoot: '.', include: ['**.Stories'], exclude: [] }
  }
}
