import { describe, it, expect } from 'vitest'
import { matchModuleGlob, filterModules } from '../lib/discovery.js'

describe('matchModuleGlob', () => {
  it('** matches any module', () => {
    expect(matchModuleGlob('**', 'Main')).toBe(true)
    expect(matchModuleGlob('**', 'Components.Button')).toBe(true)
    expect(matchModuleGlob('**', 'Components.Button.Large')).toBe(true)
  })

  it('* matches exactly one segment', () => {
    expect(matchModuleGlob('*', 'Main')).toBe(true)
    expect(matchModuleGlob('*', 'Main.Sub')).toBe(false)
  })

  it('Components.* matches one level deep', () => {
    expect(matchModuleGlob('Components.*', 'Components.Button')).toBe(true)
    expect(matchModuleGlob('Components.*', 'Components.Button.Large')).toBe(false)
  })

  it('Components.** matches any depth', () => {
    expect(matchModuleGlob('Components.**', 'Components.Button')).toBe(true)
    expect(matchModuleGlob('Components.**', 'Components.Button.Large')).toBe(true)
    expect(matchModuleGlob('Components.**', 'Main')).toBe(false)
  })

  it('exact match works', () => {
    expect(matchModuleGlob('Main', 'Main')).toBe(true)
    expect(matchModuleGlob('Main', 'Main.Sub')).toBe(false)
    expect(matchModuleGlob('Main', 'Other')).toBe(false)
  })

  it('**.Internal.** matches internal modules at any depth', () => {
    expect(matchModuleGlob('**.Internal.**', 'Components.Internal.Helpers')).toBe(true)
    expect(matchModuleGlob('**.Internal.**', 'Internal.Core')).toBe(true)
    expect(matchModuleGlob('**.Internal.**', 'Components.Button')).toBe(false)
  })
})

describe('filterModules', () => {
  it('applies include and exclude', () => {
    const config = { outputDir: './output', include: ['Components.**'], exclude: ['**.Internal.**'] }
    const modules = ['Components.Button', 'Components.Internal.Helpers', 'Main', 'Components.Card']
    expect(filterModules(config, modules)).toEqual(['Components.Button', 'Components.Card'])
  })
})
