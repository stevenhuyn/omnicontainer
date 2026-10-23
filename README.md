# Personal Devcontainer

## What's inside

- node and pnpm
- rust via rustup
- python via uv (+ ruff)
- jj vcs
- ripgrep, fd, tree, shellcheck, jq, fzf

## Defaults

- **Release cooldown**: npm, pnpm and uv refuse package versions published less
  than 3 days ago (`RELEASE_COOLDOWN_DAYS` in `devcontainer.json`). To let one
  through in a project:
  - pnpm: `minimumReleaseAgeExclude: [pkg]` in `pnpm-workspace.yaml`
  - npm: `npm i --min-release-age 0 pkg@version`
  - uv: `exclude-newer-package = { pkg = false }` under `[tool.uv]`
- **No dependency install scripts**: `ignore-scripts=true` for npm; pnpm only
  runs build scripts you approve (`pnpm approve-builds`).
- **Shared caches**: pnpm store, uv, npm and the cargo registry live on volumes
  shared by every project using this container, so rebuilds don't redownload.
- **Formatters on save**: biome (JS/TS), rust-analyzer (Rust), ruff (Python).

## Requirements

1. vscode
2. Install Remote Development Pack by Microsoft

## bashrc alias

Here's my alias for using this
```bash
alias devcontainer='jj git clone https://github.com/stevenhuyn/omnicontainer /tmp/omnicontainer && cp -r /tmp/omnicontainer/.devcontainer . && rm -rf /tmp/omnicontainer'
```

## Issues

Might need to `CTRL + SHIFT + P` + `Reload Window`
Per this issue: https://github.com/microsoft/vscode-remote-release/issues/11306

## jj/git authentication

```
gh auth login
gh auth setup-git
```