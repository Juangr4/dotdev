# Dotfiles Configuration

This repository contains my personal dotfiles configuration. It uses ansible to manage the configuration of my personal machines. At the moment, It has fully support to Fedora. Don't expect it to be updated frequently, as I use it only on my personal machines.

## Installation

To install the configuration on a new machine, you can run the following command:

```bash
curl -s https://raw.githubusercontent.com/Juangr4/dotdev/refs/heads/master/dotfiles | sh
```

This will clone the repository and run the ansible playbook to configure the machine.

If you are on Windows, you can run the following command to install prefered tools and configuration:

```powershell
iwr https://raw.githubusercontent.com/Juangr4/dotdev/refs/heads/master/setup.ps1 -UseBasicParsing | iex
```

## Tools for each OS

| Tool/Role | Fedora | Ubuntu | Arch | Windows |
|:---------:|:------:|:------:|:----:|:-------:|
| bat       |    ✔   |    ✔   |   ✔  |    ✘    |
| btop      |    ✔   |    ✘   |   ✔  |    ✘    |
| chrome    |    ✔   |    ✘   |   ✘  |    ✔    |
| desktop   |    ✔   |    ✘   |   ✔  |    ✘    |
| discord   |    ✔   |    ✘   |   ✘  |    ✘    |
| docker    |    ✔   |    ✔   |   ✔  |    ✘    |
| fastfetch |    ✔   |    ✔   |   ✔  |    ✘    |
| fonts     |    ✔   |    ✔   |   ✔  |    ✘    |
| fzf       |    ✔   |    ✔   |   ✔  |    ✔    |
| git       |    ✔   |    ✔   |   ✔  |    ✔    |
| kitty     |    ✔   |    ✔   |   ✔  |    ✘    |
| lazygit   |    ✔   |    ✔   |   ✔  |    ✔    |
| lsd       |    ✔   |    ✔   |   ✔  |    ✘    |
| mise      |    ✔   |    ✔   |   ✔  |    ✔    |
| neovim    |    ✔   |    ✔   |   ✔  |    ✘    |
| starship  |    ✔   |    ✔   |   ✔  |    ✔    |
| yazi      |    ✘   |    ✘   |   ✔  |    ✘    |
| zellij    |    ✔   |    ✔   |   ✔  |    ✘    |
| zsh       |    ✔   |    ✔   |   ✔  |    ✘    |

## References and Credits

For ansible setup:

- [TechDufus dotfiles](https://github.com/TechDufus/dotfiles)
- [ALT-F4-LLC dotfiles](https://github.com/ALT-F4-LLC/dotfiles)

For hyprland configuration:

- [WinterKRALLe dotfiles](https://github.com/WinterKRALLe/dotfiles)
