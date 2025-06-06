# kickstart-modular.nvim

## Introduction

*This is a fork of [nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) that moves from a single file to a multi file configuration.*

A starting point for Neovim that is:

* Small
* Modular
* Completely Documented

**NOT** a Neovim distribution, but instead a starting point for your configuration.

## Installation

### Install Neovim

Kickstart.nvim targets *only* the latest
['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest
['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim.
If you are experiencing issues, please make sure you have the latest versions.

### Install External Dependencies

External Requirements:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation),
  [fd-find](https://github.com/sharkdp/fd#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on the platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Emoji fonts (Ubuntu only, and only if you want emoji!) `sudo apt install fonts-noto-color-emoji`
- Language Setup:
  - If you want to write Typescript, you need `npm`
  - If you want to write Golang, you will need `go`
  - etc.

> [!NOTE]
> See [Install Recipes](#Install-Recipes) for additional Windows and Linux specific notes
> and quick install snippets

### Install Kickstart

> [!NOTE]
> [Backup](#FAQ) your previous configuration (if any exists)

Neovim's configurations are located under the following paths, depending on your OS:

| OS | PATH |
| :- | :--- |
| Linux, MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)| `%localappdata%\nvim\` |
| Windows (powershell)| `$env:LOCALAPPDATA\nvim\` |

#### Recommended Step

[Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repo
so that you have your own copy that you can modify, then install by cloning the
fork to your machine using one of the commands below, depending on your OS.

> [!NOTE]
> Your fork's URL will be something like this:
> `https://github.com/<your_github_username>/kickstart-modular.nvim.git`

You likely want to remove `lazy-lock.json` from your fork's `.gitignore` file
too - it's ignored in the kickstart repo to make maintenance easier, but it's
[recommended to track it in version control](https://lazy.folke.io/usage/lockfile).

#### Clone kickstart.nvim

> [!NOTE]
> If following the recommended step above (i.e., forking the repo), replace
> `dam9000` with `<your_github_username>` in the commands below

<details><summary> Linux and Mac </summary>

```sh
git clone https://github.com/dam9000/kickstart-modular.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary> Windows </summary>

If you're using `cmd.exe`:

```
git clone https://github.com/dam9000/kickstart-modular.nvim.git "%localappdata%\nvim"
```

If you're using `powershell.exe`

```
git clone https://github.com/dam9000/kickstart-modular.nvim.git "${env:LOCALAPPDATA}\nvim"
```

</details>

### Post Installation

Start Neovim

```sh
nvim
```

That's it! Lazy will install all the plugins you have. Use `:Lazy` to view
the current plugin status. Hit `q` to close the window.

## Configuration Structure

This configuration is organized into modular files:

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── keymaps.lua         # All keybindings (centralized)
│   ├── options.lua         # Neovim options
│   ├── lazy-bootstrap.lua  # Lazy.nvim setup
│   ├── lazy-plugins.lua    # Plugin specifications
│   └── kickstart/
│       ├── health.lua      # Health check configuration
│       └── plugins/        # Individual plugin configurations
│           ├── autopairs.lua
│           ├── blink-cmp.lua
│           ├── conform.lua
│           ├── copilot.lua
│           ├── debug.lua
│           ├── fugitive.lua
│           ├── gitsigns.lua
│           ├── hardtime.lua
│           ├── harpoon.lua
│           ├── indent_line.lua
│           ├── lint-enhanced.lua
│           ├── lint.lua
│           ├── lspconfig.lua
│           ├── mini.lua
│           ├── neogen.lua
│           ├── obsidian.lua
│           ├── oil.lua
│           ├── telescope.lua
│           ├── todo-comments.lua
│           ├── tokyonight.lua
│           ├── treesitter.lua
│           ├── trouble.lua
│           ├── undotree.lua
│           └── which-key.lua
└── custom/
    └── plugins/
        └── init.lua        # Your custom plugins
```

## Plugin Guide & Usage

All keybinds are centrally located in `lua/keymaps.lua`. The `<leader>` key is set to `Space`.

### 🔧 Core Editor

#### Basic Navigation
- `<Esc>` - Clear search highlights
- `<C-h/j/k/l>` - Move focus between windows
- `<Esc><Esc>` - Exit terminal mode

#### Diagnostics
- `<leader>q` - Open diagnostic quickfix list

### 📁 File Management

#### Oil (File Explorer)
**Plugin**: `stevearc/oil.nvim`

- `-` - Open parent directory in Oil
- `<leader>-` - Open Oil in floating window
- Inside Oil:
  - `<CR>` - Select file/directory
  - `<C-s>` - Open in vertical split
  - `<C-h>` - Open in horizontal split
  - `<C-t>` - Open in new tab
  - `g?` - Show help with all keybinds

### 🔍 Search & Navigation

#### Telescope (Fuzzy Finder)
**Plugin**: `nvim-telescope/telescope.nvim`

- `<leader>sh` - Search Help tags
- `<leader>sk` - Search Keymaps
- `<leader>sf` - Search Files
- `<leader>ss` - Search Select Telescope (builtin pickers)
- `<leader>sw` - Search current Word under cursor
- `<leader>sg` - Search by Live Grep
- `<leader>sd` - Search Diagnostics
- `<leader>sr` - Search Resume (previous search)
- `<leader>s.` - Search Recent Files
- `<leader><leader>` - Find existing buffers
- `<leader>/` - Fuzzily search in current buffer
- `<leader>s/` - Search in Open Files
- `<leader>sn` - Search Neovim configuration files

#### Harpoon (Quick File Navigation)
**Plugin**: `ThePrimeagen/harpoon`

- `<leader>ha` - Add current file to Harpoon
- `<leader>hh` - Toggle Harpoon quick menu
- `<leader>h1` - Navigate to Harpoon file 1
- `<leader>h2` - Navigate to Harpoon file 2
- `<leader>h3` - Navigate to Harpoon file 3
- `<leader>h4` - Navigate to Harpoon file 4
- `<leader>hp` - Navigate to previous Harpoon file
- `<leader>hn` - Navigate to next Harpoon file

### 🗂️ Git Integration

#### Fugitive (Git Commands)
**Plugin**: `tpope/fugitive`

- `<leader>gs` - Git Status
- `<leader>gd` - Git Diff (split view)
- `<leader>gc` - Git Commit
- `<leader>gb` - Git Blame
- `<leader>gl` - Git Log
- `<leader>gp` - Git Push
- `<leader>gP` - Git Pull
- `<leader>gf` - Git Fetch
- `<leader>gw` - Git Write (stage current file)
- `<leader>gr` - Git Read (checkout current file)

#### Gitsigns (Git Status in Gutter)
**Plugin**: `lewis6991/gitsigns.nvim`

**Navigation:**
- `]c` - Jump to next git change
- `[c` - Jump to previous git change

**Actions:**
- `<leader>hs` - Stage hunk (normal and visual mode)
- `<leader>hr` - Reset hunk (normal and visual mode)
- `<leader>hS` - Stage entire buffer
- `<leader>hu` - Undo stage hunk
- `<leader>hR` - Reset entire buffer
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line
- `<leader>hd` - Diff against index
- `<leader>hD` - Diff against last commit

**Toggles:**
- `<leader>tb` - Toggle git blame line
- `<leader>tD` - Toggle git show deleted

### 💻 Language Server Protocol (LSP)

#### LSP Actions
**Plugin**: `neovim/nvim-lspconfig`

All LSP keybinds are automatically set when an LSP attaches to a buffer:

- `grn` - Rename symbol
- `gra` - Code actions (normal and visual mode)
- `grr` - Go to references (via Telescope)
- `gri` - Go to implementation (via Telescope)
- `grd` - Go to definition (via Telescope)
- `grD` - Go to declaration
- `gO` - Open document symbols (via Telescope)
- `gW` - Open workspace symbols (via Telescope)
- `grt` - Go to type definition (via Telescope)
- `<leader>th` - Toggle inlay hints (if supported by LSP)

#### Auto-completion
**Plugin**: `saghen/blink.cmp`

- `<Tab>` - Accept completion / Move forward in snippet
- `<S-Tab>` - Move backward in snippet
- `<C-Space>` - Trigger completion menu
- `<C-n>/<C-p>` or `<Up>/<Down>` - Navigate completion items
- `<C-e>` - Close completion menu
- `<C-k>` - Toggle signature help

### 🎨 Code Formatting & Linting

#### Conform (Code Formatting)
**Plugin**: `stevearc/conform.nvim`

- `<leader>f` - Format current buffer

**Supported Languages:**
- Lua (stylua), Python (isort, black), Go (gofumpt)
- Shell/Bash (shfmt), YAML/JSON (prettier), Markdown (prettier)
- Terraform (terraform_fmt), JavaScript/TypeScript (prettier)

#### Lint (Code Linting)
**Plugin**: `mfussenegger/nvim-lint`

- `<leader>l` - Manually trigger linting

**Auto-linting triggers:**
- On file enter, save, and when leaving insert mode

**Supported Linters:**
- Python (flake8, mypy), Go (golangci-lint), Shell (shellcheck)
- YAML (yamllint), Dockerfile (hadolint), Terraform (tflint)
- Markdown (markdownlint), JSON (jsonlint)

### 🤖 AI & Development Tools

#### GitHub Copilot (AI Code Completion)
**Plugin**: `github/copilot.vim`

- `<C-j>` - Accept Copilot suggestion (insert mode)
- `<C-]>` - Dismiss Copilot suggestion (insert mode)
- `<C-\>` - Next Copilot suggestion (insert mode)
- `<C-[>` - Previous Copilot suggestion (insert mode)

**Setup:**
- After installation, run `:Copilot auth` to authenticate
- Suggestions appear automatically while typing

#### Hardtime (Vim Habit Training)
**Plugin**: `m4xshen/hardtime.nvim`

- `<leader>th` - Toggle Hardtime on/off

**Features:**
- Prevents repeated use of arrow keys and hjkl
- Encourages use of more efficient Vim motions
- Configurable restrictions and hints
- Disabled in certain filetypes (telescope, oil, etc.)

### 🐛 Debugging

#### DAP (Debug Adapter Protocol)
**Plugin**: `mfussenegger/nvim-dap`

- `<F5>` - Start/Continue debugging
- `<F1>` - Step into
- `<F2>` - Step over
- `<F3>` - Step out
- `<leader>b` - Toggle breakpoint
- `<leader>B` - Set conditional breakpoint
- `<F7>` - Toggle debug UI

**Supported Debuggers:**
- Go (Delve), and other languages via Mason

### 📝 Documentation & Notes

#### Neogen (Documentation Generator)
**Plugin**: `danymat/neogen`

- `<leader>nf` - Generate function documentation
- `<leader>nc` - Generate class documentation
- `<leader>nt` - Generate type documentation
- `<leader>nF` - Generate file documentation

**Supported Languages:**
- Python (Google docstrings), Go (godoc), Bash

#### Obsidian (Note Taking)
**Plugin**: `epwalsh/obsidian.nvim`

- `<leader>on` - Create new note
- `<leader>oo` - Open existing note
- `<leader>os` - Search notes
- `<leader>oq` - Quick switch between notes
- `<leader>od` - Open today's daily note
- `<leader>oy` - Open yesterday's daily note
- `<leader>ob` - Show backlinks
- `<leader>ol` - Show all links
- `<leader>ot` - Insert template
- `<leader>op` - Paste image
- `<leader>or` - Rename current note

**Features:**
- Wiki-style linking: `[[note-name]]`
- Markdown support with live preview
- Daily notes functionality
- Template system
- Integration with Obsidian vault at `~/obsidian-vault`

### 🔧 Utilities

#### Trouble (Diagnostics UI)
**Plugin**: `folke/trouble.nvim`

- `<leader>xx` - Toggle Trouble
- `<leader>xw` - Workspace diagnostics
- `<leader>xd` - Document diagnostics
- `<leader>xq` - Quickfix list
- `<leader>xl` - Location list
- `gR` - LSP references

#### UndoTree (Undo History)
**Plugin**: `mbbill/undotree`

- `<leader>u` - Toggle undo tree

### 🎯 Text Objects & Editing

#### Mini.nvim (Text Objects & Surround)
**Plugin**: `echasnovski/mini.nvim`

**Auto-pairs:** Automatic bracket/quote pairing
**AI Text Objects:** Enhanced text objects (auto-configured)
**Surround:** 
- `saiw)` - Surround add inner word with parentheses
- `sd'` - Surround delete quotes  
- `sr)'` - Surround replace parentheses with quotes

#### Treesitter (Syntax Highlighting)
**Plugin**: `nvim-treesitter/nvim-treesitter`

- Enhanced syntax highlighting and code understanding
- Auto-configured for many languages

### 🎨 Theme

#### Tokyo Night
**Plugin**: `folke/tokyonight.nvim`

Dark theme with multiple variants. Auto-configured.

### ❓ Help & Discovery

#### Which-key (Keybind Help)
**Plugin**: `folke/which-key.nvim`

- Automatically shows available keybinds when you start typing a combination
- Shows grouped commands (e.g., all `<leader>g*` git commands)

## Customization

### Adding Your Own Plugins

Add plugins to `lua/custom/plugins/init.lua`:

```lua
return {
  {
    'your-plugin/name',
    config = function()
      -- Plugin configuration
    end,
  },
}
```

### Modifying Keybinds

All keybinds are centralized in `lua/keymaps.lua`. To modify:

1. Open `lua/keymaps.lua`
2. Find the plugin section you want to modify
3. Change the keybind or add new ones

### Plugin Configuration

Each plugin has its own file in `lua/kickstart/plugins/`. To modify a plugin:

1. Navigate to the plugin file (e.g., `lua/kickstart/plugins/telescope.lua`)
2. Modify the configuration options
3. Keybinds are handled in `lua/keymaps.lua`, not in plugin files

### Language Server Setup

LSP servers are automatically installed via Mason. To add a new language:

1. Edit `lua/kickstart/plugins/lspconfig.lua`
2. Add the server to the `ensure_installed` list
3. Configure the server in the `servers` table

### Formatter/Linter Setup

1. **Formatters**: Edit `lua/kickstart/plugins/conform.lua`
2. **Linters**: Edit `lua/kickstart/plugins/lint-enhanced.lua`

## Getting Started

1. **Learn the basics**: `:help` or `<leader>sh` (Search Help)
2. **Explore keybinds**: `<leader>sk` (Search Keymaps) or just start typing `<leader>` and Which-key will show options
3. **Find files**: `<leader>sf` (Search Files) or `<leader>sg` (Search by Grep)
4. **Git workflow**: `<leader>gs` (Git Status) and explore git keybinds with `<leader>g`
5. **LSP features**: Use `gr*` commands for code navigation and `<leader>` for actions

### FAQ

* What should I do if I already have a pre-existing Neovim configuration?
  * You should back it up and then delete all associated files.
  * This includes your existing init.lua and the Neovim files in `~/.local`
    which can be deleted with `rm -rf ~/.local/share/nvim/`
* Can I keep my existing configuration in parallel to kickstart?
  * Yes! You can use [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME)`=nvim-NAME`
    to maintain multiple configurations. For example, you can install the kickstart
    configuration in `~/.config/nvim-kickstart` and create an alias:
    ```
    alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
    ```
    When you run Neovim using `nvim-kickstart` alias it will use the alternative
    config directory and the matching local directory
    `~/.local/share/nvim-kickstart`. You can apply this approach to any Neovim
    distribution that you would like to try out.
* What if I want to "uninstall" this configuration:
  * See [lazy.nvim uninstall](https://lazy.folke.io/usage#-uninstalling) information

### Install Recipes

Below you can find OS specific install instructions for Neovim and dependencies.

After installing all the dependencies continue with the [Install Kickstart](#Install-Kickstart) step.

#### Windows Installation

<details><summary>Windows with Microsoft C++ Build Tools and CMake</summary>
Installation may require installing build tools and updating the run command for `telescope-fzf-native`

See `telescope-fzf-native` documentation for [more details](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation)

This requires:

- Install CMake and the Microsoft C++ Build Tools on Windows

```lua
{'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
```
</details>
<details><summary>Windows with gcc/make using chocolatey</summary>
Alternatively, one can install gcc and make which don't require changing the config,
the easiest way is to use choco:

1. install [chocolatey](https://chocolatey.org/install)
either follow the instructions on the page or use winget,
run in cmd as **admin**:
```
winget install --accept-source-agreements chocolatey.chocolatey
```

2. install all requirements using choco, exit the previous cmd and
open a new one so that choco path is set, and run in cmd as **admin**:
```
choco install -y neovim git ripgrep wget fd unzip gzip mingw make
```
</details>
<details><summary>WSL (Windows Subsystem for Linux)</summary>

```
wsl --install
wsl
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>

#### Linux Install
<details><summary>Ubuntu Install Steps</summary>

```
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>
<details><summary>Debian Install Steps</summary>

```
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip curl

# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo mkdir -p /opt/nvim-linux-x86_64
sudo chmod a+rX /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/
```
</details>
<details><summary>Fedora Install Steps</summary>

```
sudo dnf install -y gcc make git ripgrep fd-find unzip neovim
```
</details>

<details><summary>Arch Install Steps</summary>

```
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim
```
</details>