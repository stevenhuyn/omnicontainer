# Personal Devcontainer

## What's inside

- node and pnpm
- rust via rustup
- python via uv
- jj vcs

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