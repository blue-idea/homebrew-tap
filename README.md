# Homebrew Tap for Blue-Idea Projects

This repository distributes official macOS universal builds for:
- **BuildUI**: https://github.com/blue-idea/BuildUI
- **Linkit**: https://github.com/blue-idea/linkit

## Install

```shell
# Install BuildUI
brew install blue-idea/tap/buildui

# Install Linkit
brew install blue-idea/tap/linkit
```

## Upgrade

```shell
# Upgrade BuildUI
brew upgrade buildui

# Upgrade Linkit
brew upgrade linkit
```

## Uninstall

```shell
# Uninstall BuildUI
brew uninstall --cask buildui

# Uninstall Linkit
brew uninstall --cask linkit
```

Applications are distributed without Apple notarization. This third-party tap removes the `com.apple.quarantine` attribute from the installed apps after installation, without `sudo` and without modifying other applications.
