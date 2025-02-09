# Dotfiles Configuration

This repository contains my personal dotfiles configuration. It uses ansible to manage the configuration of my personal machines. At the moment, it only supports Fedora and Ubuntu distributions.

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

## References and Credits

For ansible setup:

- [TechDufus dotfiles](https://github.com/TechDufus/dotfiles)
- [ALT-F4-LLC dotfiles](https://github.com/ALT-F4-LLC/dotfiles)

For hyprland configuration:

- [WinterKRALLe dotfiles](https://github.com/WinterKRALLe/dotfiles)
