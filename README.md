# Personal Devcontainer

## Requirements

1. vscode
2. Install Remote Development Pack by Microsoft

## bashrc alias

Here's my alias for using this
```bash
alias devcontainer='git clone https://github.com/stevenhuyn/.devcontainer.git .devcontainer && rm -rf .devcontainer/.git .devcontainer/README.md && cp -r .devcontainer/.devcontainer/. .devcontainer/ && rm -rf .devcontainer/.devcontainer'
```

## Issues

Might need to `CTRL + SHIFT + P` + `Reload Window`
Per this issue: https://github.com/microsoft/vscode-remote-release/issues/11306

```
gh auth login
gh auth setup-git
```