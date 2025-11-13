# Personal Devcontainer

## Requirements

1. vscode
2. Install Remote Development Pack by Microsoft

## bashrc alias

Here's my alias for using this
```bash
alias devcontainer='git clone https://github.com/stevenhuyn/.devcontainer.git .devcontainer && rm -rf .devcontainer/.git .devcontainer/README.md && cp -r .devcontainer/.devcontainer/. .devcontainer/ && rm -rf .devcontainer/.devcontainer'
```

