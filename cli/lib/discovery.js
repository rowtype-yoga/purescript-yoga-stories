import { readdir, readFile, stat } from 'node:fs/promises'
import { join } from 'node:path'

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

export async function discoverStories(config) {
  const allModules = await listOutputModules(config.outputDir)
  const matched = filterModules(config, allModules)
  const stories = []
  for (const mod of matched) {
    try {
      const corefnPath = join(config.outputDir, mod, 'corefn.json')
      const corefn = JSON.parse(await readFile(corefnPath, 'utf-8'))
      const moduleName = corefn.moduleName.join('.')
      const sourcePath = corefn.modulePath
      const sourceCode = await readFile(sourcePath, 'utf-8')
      stories.push({ moduleName, sourcePath, exports: corefn.exports, sourceCode })
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
    return { outputDir: './output', include: ['**.Stories'], exclude: [] }
  }
}
