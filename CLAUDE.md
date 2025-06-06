# Claude Instructions for Neovim Configuration

## Overview
This is a Kickstart.nvim-based Neovim configuration with additional plugins for development workflow enhancement.

## Plugin Structure
- Main plugin loader: `lua/lazy-plugins.lua`
- Individual plugin configs: `lua/kickstart/plugins/`
- Custom plugins can be added to: `lua/custom/plugins/`

## Key Plugins Installed
- **GitHub Copilot**: AI-powered code completion
- **Obsidian.nvim**: Note-taking integration with Obsidian vault
- **Hardtime.nvim**: Helps break bad Vim habits
- **Oil.nvim**: File explorer
- **Harpoon**: Quick file navigation
- **Fugitive**: Git integration
- **Telescope**: Fuzzy finder
- **Treesitter**: Syntax highlighting
- **LSP**: Language server protocol support

## Development Commands
- **Linting**: Check project structure for available lint commands
- **Testing**: Check for test scripts in package.json or project root
- **Building**: Look for build commands in project configuration

## File Paths
- Config root: `/Users/gauranshmathur/.config/nvim/`
- Plugin configs: `lua/kickstart/plugins/`
- Main init: `init.lua`
- Keymaps: `lua/keymaps.lua`

## Notes
- Always check existing plugin structure before adding new plugins
- Follow the modular approach with separate files in kickstart/plugins/
- Obsidian vault is expected at `~/obsidian-vault`
- Copilot requires authentication after installation with `:Copilot auth`