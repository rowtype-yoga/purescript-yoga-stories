# Contributing

## Releasing the `yoga-stories` CLI to npm

Releases are published to npm by the `.github/workflows/publish-cli.yml`
workflow, triggered by pushing a `v*` git tag. Authentication uses npm
[trusted publishing](https://docs.npmjs.com/trusted-publishers) via GitHub
OIDC — no `NPM_TOKEN` secret is stored in the repo.

### One-time setup

1. Publish the package manually once to claim the name on npm (only needed if
   `yoga-stories` does not yet exist on the registry):
   ```sh
   cd cli
   npm publish --access public
   ```
2. On <https://www.npmjs.com/package/yoga-stories/access>, add a **Trusted
   Publisher** with:
   - Organization or user: `rowtype-yoga`
   - Repository: `purescript-yoga-stories`
   - Workflow filename: `publish-cli.yml`
   - Environment: *(blank)*

### Cutting a release

1. Bump the version in `cli/package.json` (semver).
2. Commit the bump on `main`.
3. Tag and push:
   ```sh
   git tag v$(node -p "require('./cli/package.json').version")
   git push origin main --tags
   ```
4. The workflow will:
   - verify the tag matches `cli/package.json`,
   - set up PureScript, Spago, and `purs-backend-es`,
   - run `npm publish --provenance --access public` from `cli/` (the
     `prepublishOnly` script builds the PureScript output).

Check the Actions tab for progress. On success the new version appears on
<https://www.npmjs.com/package/yoga-stories> with a provenance attestation.

### Troubleshooting

- **`Tag vX.Y.Z does not match cli/package.json version`** — you forgot to
  bump `cli/package.json` before tagging. Delete the tag (`git tag -d vX.Y.Z`
  and `git push --delete origin vX.Y.Z`), fix the version, retag.
- **`npm error 403` on publish** — trusted publisher is not configured, or
  the workflow filename / repo doesn't match what's registered on npm.
