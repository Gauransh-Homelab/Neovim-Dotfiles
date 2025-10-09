# Plugin Overview for DevSecOps Workflows

This document summarizes the Neovim plugins configured in this repository and highlights how they help when working with Terragrunt/Terraform, Bash, and PowerShell scripts.

## Core Editing Experience

- **Guess Indent (`NMAC427/guess-indent.nvim`)** – Automatically detects indentation settings when you open a file, so Terraform, Terragrunt, Bash, and PowerShell files follow the existing style without manual adjustments.【F:lua/lazy-plugins.lua†L13-L14】
- **Treesitter (`nvim-treesitter`)** – Provides syntax-aware highlighting and indentation for many languages, including Bash and Terraform, with automatic parser installation enabled.【F:lua/kickstart/plugins/treesitter.lua†L2-L19】
- **Mini.nvim** – Supplies ergonomic text objects, surround editing, and a lightweight statusline to speed up refactors across scripting files.【F:lua/kickstart/plugins/mini.lua†L2-L36】
- **Midnight Colorscheme** – Sets a high-contrast theme that keeps long Terragrunt plans or shell scripts readable during long sessions.【F:lua/kickstart/plugins/tokyonight.lua†L2-L13】
- **Hardtime (`m4xshen/hardtime.nvim`)** – (Disabled by default) Encourages efficient movement habits by warning about repetitive keypresses, helping you navigate large IaC files faster once enabled.【F:lua/custom/plugins/hardtime.lua†L1-L56】

## Navigation & Organization

- **Telescope** – Powerful fuzzy finder for files, symbols, diagnostics, and command history. Useful for jumping between Terragrunt modules or locating scripts quickly; it is configured to show hidden files and use the FZF extension when available.【F:lua/kickstart/plugins/telescope.lua†L8-L77】
- **Harpoon** – Keeps a shortlist of frequently edited files so you can hop between Terragrunt stacks, shell scripts, and documentation without losing context.【F:lua/custom/plugins/harpoon.lua†L1-L9】
- **Oil** – Replaces netrw with a modern file explorer featuring metadata columns and floating window support, making it easier to inspect deployment directories in-place.【F:lua/custom/plugins/oil.lua†L1-L113】
- **Dashboard.nvim** – Presents a start screen with shortcuts for updating plugins or opening files, so you can launch into infrastructure repositories quickly.【F:lua/custom/plugins/dashboard.lua†L1-L60】

## Git & Collaboration

- **Gitsigns** – Adds inline indicators for changes plus hunk navigation, helping you review differences in Terragrunt plans or shell modules before committing.【F:lua/kickstart/plugins/gitsigns.lua†L1-L27】
- **Fugitive** – Full-featured Git wrapper within Neovim for staging, committing, and diffing without leaving the editor.【F:lua/custom/plugins/fugitive.lua†L1-L4】
- **Which-Key** – Displays discoverable keymaps for git, navigation, diagnostics, and custom tools, reducing the cognitive load when switching tasks.【F:lua/kickstart/plugins/which-key.lua†L1-L205】

## LSP, Completion & Formatting

- **LSP Stack (`nvim-lspconfig` + Mason ecosystem)** – Automatically installs and configures language servers tailored for DevSecOps work (Terraform, Bash, YAML, Docker, etc.), enabling go-to-definition, hover, and diagnostics inside infrastructure code.【F:lua/kickstart/plugins/lspconfig.lua†L1-L283】
- **Blink.cmp** – Provides completion suggestions from LSP, filesystem paths, and snippets with inline documentation toggles for faster script authoring.【F:lua/kickstart/plugins/blink-cmp.lua†L1-L87】
- **Conform.nvim** – Handles on-save formatting using language-specific formatters (Terraform fmt, shfmt, Prettier, etc.), keeping Terraform/Terragrunt and shell code consistent across the team.【F:lua/kickstart/plugins/conform.lua†L1-L39】
- **nvim-lint** – Runs linting tools like `tflint`, `shellcheck`, and `yamllint` automatically when you edit files, surfacing infrastructure issues early.【F:lua/custom/plugins/lint-enhanced.lua†L1-L47】
- **Todo Comments** – Highlights and searches TODO/FIXME tags across scripts so you can track follow-up items in infrastructure automation code.【F:lua/kickstart/plugins/todo-comments.lua†L1-L3】
- **Neogen** – Generates documentation stubs tailored to Bash, Go, and Python, streamlining inline docs for reusable deployment tooling.【F:lua/custom/plugins/neogen.lua†L1-L24】

## Diagnostics & History

- **Trouble.nvim** – Provides a dedicated list view for diagnostics, quickfix, and references, making it easy to triage Terraform validation errors or lint findings.【F:lua/custom/plugins/trouble.lua†L1-L63】
- **Undotree** – Visualizes your undo history so you can safely explore changes when experimenting with complex Terragrunt blocks or shell functions.【F:lua/custom/plugins/undotree.lua†L1-L12】

## Documentation & Knowledge Base

- **Copilot** – AI pair programming assistant triggered in insert mode with custom keybindings for accepting or cycling suggestions, handy for bootstrapping scripts or Terraform resources.【F:lua/custom/plugins/copilot.lua†L1-L16】
- **Obsidian.nvim** – Integrates an Obsidian vault, letting you capture runbooks or infrastructure notes alongside your code, complete with custom mappings and template support.【F:lua/custom/plugins/obsidian.lua†L1-L72】
- **Markdown Preview** – Launches a live browser preview for Markdown documentation so you can verify runbooks or README updates without leaving Neovim.【F:lua/custom/plugins/markdown-preview.lua†L1-L40】

## Additional Tips

- Mason installs the language servers, linters, and formatters listed in the LSP configuration. Use `:Mason` or `:MasonToolsUpdate` to ensure Terraform (`terraformls`), Terragrunt (`tflint`), and shell tooling (`shellcheck`, `shfmt`) stay current.【F:lua/kickstart/plugins/lspconfig.lua†L214-L252】
- Use `<leader>l` to run linting (`nvim-lint`) and `<leader>f` to format (`conform`) the current buffer, as advertised in the Which-Key menu.【F:lua/kickstart/plugins/which-key.lua†L157-L205】

This setup aims to make Neovim a complete IDE for infrastructure automation: quick navigation, Git workflows, real-time diagnostics, and documentation tooling are all wired in to support Terragrunt, Bash, and PowerShell-centric development.
