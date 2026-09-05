# Barg Labs Homebrew tap

Install Cejel, the offline engineering-trust certificate for codebases:

```bash
brew install BargLabs/tap/cejel
```

The formula installs the platform-native executable from the corresponding verified Cejel
GitHub release and checks its SHA-256 digest before installation.

## Release checklist

- In `.github/workflows/verify-cejel-consumer-routes.yml`, the
  `uses: BargLabs/cejel@vX.Y.Z` pin under `action-routes` is a literal version tag (GitHub
  Actions forbids expressions in `uses:`) and must be bumped by hand each release; the
  `@main` and `/action@v1` routes are intentionally left floating and should not be touched.
