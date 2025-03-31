# Neovim Dotfiles

## Introduction

This repository contains a carefully crafted Neovim configuration designed with modularity and readability in mind. Built upon the principles of kickstart.nvim, this configuration has been tailored to enhance developer productivity while maintaining a clean, understandable structure.

The core design principles:
- **Modularity:** Configuration is organized into logical, focused files for easier maintenance
- **Documentation:** Comprehensive comments explain the reasoning behind configuration choices
- **Modern Approach:** Leverages Neovim's latest features and ecosystem

## Prerequisites

### 1. Neovim Version

This configuration is optimized for Neovim's latest **stable** or **nightly** releases (version 0.9+). For installation instructions, please refer to the [Neovim Installation Guide](https://github.com/neovim/neovim/wiki/Installing-Neovim).

### 2. Required Dependencies

Ensure the following tools are installed and accessible in your PATH:

| Dependency | Description | Required For |
|------------|-------------|-------------|
| Git, Make, Unzip | Basic build tools | Plugin management |
| C Compiler (gcc/clang) | Used for compiling binary components | Certain plugins |
| [Ripgrep](https://github.com/BurntSushi/ripgrep#installation) | Fast search tool | Telescope's live grep |
| Clipboard Tool | OS-specific clipboard integration:<br>• Linux: `xclip` or `xsel`<br>• macOS: `pbcopy`/`pbpaste` (pre-installed)<br>• Windows: `win32yank` | System clipboard integration |

### 3. Optional Enhancements

- **[Nerd Font](https://www.nerdfonts.com/)**: Required for proper icon display in the UI
- **Language-specific runtimes**: While `mason.nvim` will manage most language servers, some require their base runtimes (e.g., Node.js for TypeScript LSP)

## Installation

> **⚠️ Important**: Back up your existing configuration before proceeding!

### Backup Existing Configuration

```bash
# Linux/macOS
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# Windows (PowerShell)
move $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
move $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

### Install Configuration

```bash
# Linux/macOS
git clone https://github.com/<your_github_username>/neovim-dotfiles.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

# Windows (PowerShell)
git clone https://github.com/<your_github_username>/neovim-dotfiles.git "$env:LOCALAPPDATA\nvim"

# Windows (Command Prompt)
git clone https://github.com/<your_github_username>/neovim-dotfiles.git "%localappdata%\nvim"
```

## First Launch

Launch Neovim:
```
nvim
```

On first launch, `lazy.nvim` will automatically install all configured plugins. You can check the installation status with `:Lazy`.

## Key Components

This configuration integrates several high-quality plugins that work together to create a cohesive development environment:

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Modern plugin manager with lazy-loading capabilities |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Native LSP client configurations |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Package manager for LSP servers, linters and formatters |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine with multiple sources |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for files, buffers, and more |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Advanced syntax highlighting and code intelligence |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git integration in the buffer |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding discovery tool |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Efficient, customizable status line |

## Customization

For personalization, start by exploring:
- `init.lua`: The entry point that loads all configuration modules
- `lua/plugins/`: Individual plugin configurations
- `lua/config/`: Core editor settings and keybindings

## Getting Started

After installation, you can:
1. Run `:checkhealth` to verify your setup
2. Use `:Mason` to install additional language servers
3. Open a project with `nvim .` and start coding immediately

Need more help? Check the inline documentation or feel free to open an issue.
