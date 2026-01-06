# NeoJim

A modern Neovim configuration built for web development with React, TypeScript, and modern JavaScript tooling. Uses Neovim 0.11+ native LSP APIs with lazy loading and optimized performance.

## Documentation

📚 **[Complete Documentation Site](https://jjohnson1994.github.io/neojim/)** - Full guides, tutorials, and reference

📖 **Built-in Help** - Access comprehensive help from within Neovim with `:help neojim`

99% Built by Claude Code

## Philosophy

NeoJim is designed with these core principles:

- **Zero Learning Curve** - All default Neovim keybindings work as expected. If you know vim, you can use this config immediately.
- **Non-Conflicting** - Custom keybindings only use `<leader>` prefix. No default behaviors are overridden.
- **Gradual Enhancement** - Discover and adopt features at your own pace. Nothing is forced on you.
- **Lightweight Foundation** - A minimal starting point for your own customizations, not a complete IDE.
- **Openly Extensible** - Easy to customize, extend, and make your own.

## Features

- 🚀 **Modern Architecture**: Built on Neovim 0.11+ with native LSP support
- ⚡ **Fast Performance**: Lazy loading with lazy.nvim plugin manager
- 💻 **Web Development**: Optimized for React, TypeScript, Vue, Svelte
- 🎨 **Multiple Themes**: tokyonight, catppuccin, rose-pine, github, monokai-pro, onedark, kanagawa
- 📦 **Minimal Core**: Close to stock Neovim with essential enhancements
- 🔍 **Smart Search**: FZF-lua for fuzzy finding and navigation
- 🌳 **File Explorer**: nvim-tree with git integration
- ✨ **Auto-completion**: blink.cmp with LuaSnip snippets
- 🔧 **LSP Integration**: Full TypeScript/JavaScript language support
- 🎯 **Formatting**: Auto-format on save with ESLint and Prettier
- 🔀 **Git Integration**: Gitsigns and Fugitive
- 🧪 **Testing**: Neotest with Vitest support

## Plugins

### LSP & Completion

- [**blink.cmp**](https://github.com/saghen/blink.cmp) - Performant, batteries-included completion plugin with fuzzy matching
- [**LuaSnip**](https://github.com/L3MON4D3/LuaSnip) - Snippet engine with friendly-snippets support
- **Native LSP** - Uses Neovim 0.11+ `vim.lsp.config` API (no nvim-lspconfig needed)
- [**mason.nvim**](https://github.com/williamboman/mason.nvim) - Portable package manager for LSP servers, formatters, and linters
- [**schemastore.nvim**](https://github.com/b0o/schemastore.nvim) - JSON schemas for JSON LSP server

### Syntax & Parsing

- [**nvim-treesitter**](https://github.com/nvim-treesitter/nvim-treesitter) - Treesitter integration for better syntax highlighting and code understanding
- [**nvim-treesitter-textobjects**](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) - Syntax-aware text objects, select, move, swap
- [**nvim-ts-autotag**](https://github.com/windwp/nvim-ts-autotag) - Auto close and rename HTML/JSX tags
- [**nvim-ts-context-commentstring**](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) - Set commentstring based on cursor location in file
- [**ts-error-translator.nvim**](https://github.com/dmmulroy/ts-error-translator.nvim) - Translate TypeScript errors to plain English

### Formatting

- [**conform.nvim**](https://github.com/stevearc/conform.nvim) - Lightweight formatting with support for Prettier, ESLint, and more

### Linting

- [**nvim-lint**](https://github.com/mfussenegger/nvim-lint) - Asynchronous linter with ESLint support

### Git Integration

- [**gitsigns.nvim**](https://github.com/lewis6991/gitsigns.nvim) - Git decorations, hunks, and blame in sign column
- [**vim-fugitive**](https://github.com/tpope/vim-fugitive) - Premier Git plugin for Vim/Neovim

### File Navigation & Search

- [**fzf-lua**](https://github.com/ibhagwan/fzf-lua) - Blazingly fast fuzzy finder over files, buffers, LSP, and more
- [**nvim-tree.lua**](https://github.com/nvim-tree/nvim-tree.lua) - File explorer with git integration

### Editing Enhancements

- [**flash.nvim**](https://github.com/folke/flash.nvim) - Navigate code with search labels, enhanced character motions, and Treesitter integration
- [**nvim-surround**](https://github.com/kylechui/nvim-surround) - Add/change/delete surrounding delimiter pairs with ease
- [**mini.ai**](https://github.com/echasnovski/mini.ai) - Extended and enhanced text objects (around/inside)
- [**mini.pairs**](https://github.com/echasnovski/mini.pairs) - Auto-pairs for brackets, quotes, and more
- [**mini.basics**](https://github.com/echasnovski/mini.basics) - Common configuration presets
- [**mini.bracketed**](https://github.com/echasnovski/mini.bracketed) - Go forward/backward with `[` and `]` for various objects

### UI & Visual

- [**snacks.nvim**](https://github.com/folke/snacks.nvim) - Collection of QoL plugins: notifications, smooth scrolling, dashboard, terminal
- [**which-key.nvim**](https://github.com/folke/which-key.nvim) - Display keybindings in a popup
- [**trouble.nvim**](https://github.com/folke/trouble.nvim) - Pretty list for diagnostics, references, quickfix, and more
- [**vim-illuminate**](https://github.com/RRethy/vim-illuminate) - Automatically highlight other uses of word under cursor
- [**mini.indentscope**](https://github.com/echasnovski/mini.indentscope) - Visualize and work with indent scope
- [**marks.nvim**](https://github.com/chentoast/marks.nvim) - View and interact with Vim marks in the sign column
- [**update-notifier**](lua/plugins/update-notifier.lua) - Auto-update config, plugins, and Treesitter on startup; refresh Mason registry

### Testing

- [**neotest**](https://github.com/nvim-neotest/neotest) - Extensible testing framework with Vitest adapter

### Specialized Tools

- [**tailwind-tools.nvim**](https://github.com/luckasRanarison/tailwind-tools.nvim) - Tailwind CSS tooling with color hints and sorting

### Colorschemes

- [**catppuccin**](https://github.com/catppuccin/nvim) - Soothing pastel theme
- [**github-nvim-theme**](https://github.com/projekt0n/github-nvim-theme) - GitHub's Neovim theme with 10+ variants (default: dark_dimmed)
- [**kanagawa.nvim**](https://github.com/rebelot/kanagawa.nvim) - Inspired by the colors of the famous painting by Katsushika Hokusai
- [**monokai-pro.nvim**](https://github.com/loctvl842/monokai-pro.nvim) - Monokai Pro theme with multiple filter variants
- [**onedark.nvim**](https://github.com/navarasu/onedark.nvim) - Atom One Dark theme with multiple style variants
- [**rose-pine**](https://github.com/rose-pine/neovim) - All natural pine, faux fur and a bit of soho vibes
- [**tokyonight.nvim**](https://github.com/folke/tokyonight.nvim) - Clean, dark Neovim theme

## Prerequisites

- **Neovim 0.11+**: Required for native LSP features
- **Git**: For plugin management
- **Node.js & npm**: For LSP servers and formatters
- **ripgrep**: For fast searching with fzf-lua
- **fd**: Recommended for file finding (required on macOS due to BSD `find` incompatibility)
- **A Nerd Font**: For icons (recommended: JetBrainsMono Nerd Font)

## Installation

### Quick Setup

<details>
<summary><b>macOS (Homebrew)</b></summary>

```bash
# Install prerequisites
brew install neovim ripgrep fd node
brew install --cask font-jetbrains-mono-nerd-font

# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this config
git clone https://github.com/yourusername/yourrepo ~/.config/nvim

# Launch Neovim (plugins will auto-install)
nvim
```

</details>

<details>
<summary><b>Linux (Ubuntu/Debian)</b></summary>

```bash
# Install prerequisites
sudo snap install nvim --classic  # or: sudo apt install neovim
sudo apt install git ripgrep fd-find nodejs npm

# Install Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "JetBrainsMono.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf
fc-cache -fv

# Note: fd-find binary is 'fdfind' on Ubuntu, create symlink:
mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd

# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this config
git clone https://github.com/yourusername/yourrepo ~/.config/nvim

# Launch Neovim (plugins will auto-install)
nvim
```

</details>

<details>
<summary><b>Linux (Fedora)</b></summary>

```bash
# Install prerequisites
sudo dnf install neovim git ripgrep fd-find nodejs npm

# Install Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "JetBrainsMono.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf
fc-cache -fv

# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this config
git clone https://github.com/yourusername/yourrepo ~/.config/nvim

# Launch Neovim (plugins will auto-install)
nvim
```

</details>

<details>
<summary><b>Linux (Arch)</b></summary>

```bash
# Install prerequisites
sudo pacman -S neovim git ripgrep fd nodejs npm

# Install Nerd Font (using AUR helper like yay)
yay -S nerd-fonts-jetbrains-mono
# Or manually:
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "JetBrainsMono.ttf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf
fc-cache -fv

# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this config
git clone https://github.com/yourusername/yourrepo ~/.config/nvim

# Launch Neovim (plugins will auto-install)
nvim
```

</details>

<details>
<summary><b>Windows (PowerShell with Scoop)</b></summary>

```powershell
# Install Scoop if you don't have it
# See: https://scoop.sh

# Install prerequisites
scoop install neovim git ripgrep fd nodejs-lts

# Install Nerd Font
scoop bucket add nerd-fonts
scoop install JetBrainsMono-NF

# Backup existing config
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup -ErrorAction SilentlyContinue

# Clone this config
git clone https://github.com/yourusername/yourrepo $env:LOCALAPPDATA\nvim

# Launch Neovim (plugins will auto-install)
nvim
```

**Note:** On Windows, config is at `%LOCALAPPDATA%\nvim` instead of `~/.config/nvim`

</details>

<details>
<summary><b>Windows (PowerShell with Chocolatey)</b></summary>

```powershell
# Install Chocolatey if you don't have it
# See: https://chocolatey.org/install

# Install prerequisites
choco install neovim git ripgrep fd nodejs-lts

# Install Nerd Font (download manually from nerdfonts.com and install)

# Backup existing config
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup -ErrorAction SilentlyContinue

# Clone this config
git clone https://github.com/yourusername/yourrepo $env:LOCALAPPDATA\nvim

# Launch Neovim (plugins will auto-install)
nvim
```

**Note:** On Windows, config is at `%LOCALAPPDATA%\nvim` instead of `~/.config/nvim`

</details>

### Post-Installation

After launching Neovim and waiting for plugins to install:

1. **Install LSP servers and tools via Mason**:

```vim
:Mason
```

Install these packages:

- **LSP Servers**: `json-lsp`, `lua_ls`, `marksman`, `svelte`, `vtsls`
- **Formatters**: `prettierd`, `stylua`, `eslint_d`
- **Linters**: `eslint_d` (if not already installed above)

2. **Restart Neovim and verify**:

```vim
:checkhealth lazy
:checkhealth vim.lsp
```

📚 **For detailed installation instructions**, see the [Getting Started Guide](https://yourusername.github.io/nvim/getting-started)

### Built-in Help

This configuration includes a comprehensive help file. Access it from within Neovim:

```vim
:help neojim
```

Browse all sections:
- `:help neojim-keybindings` - Complete keybinding reference
- `:help neojim-plugins` - All installed plugins
- `:help neojim-lsp` - LSP server configuration
- `:help neojim-customization` - Customization guide

## File Structure

```
~/.config/nvim/
├── .stylua.toml                      # Stylua (Lua formatter) configuration
├── init.lua                          # Entry point - bootstraps lazy.nvim
├── doc/
│   └── neojim.txt                    # Built-in help documentation
├── lua/
│   ├── options.lua                   # Core settings, keymaps, LSP enable
│   ├── persist.lua                   # Toggle state persistence module
│   └── plugins/
│       ├── blink.lua                 # Completion engine with LuaSnip
│       ├── luasnip.lua              # Snippet engine
│       ├── lsp-config.lua           # LSP + Mason configuration
│       ├── treesitter.lua           # Syntax highlighting
│       ├── conform.lua              # Formatting
│       ├── nvim-lint.lua            # Linting
│       ├── fzf-lua.lua              # Fuzzy finder
│       ├── nvim-tree.lua            # File explorer
│       ├── gitsigns.lua             # Git decorations
│       ├── fugitive.lua             # Git commands
│       ├── trouble.lua              # Diagnostics UI
│       ├── which-key.lua            # Keymap hints
│       ├── flash.lua                # Navigation with search labels
│       ├── snacks.lua               # Notifications, scrolling, dashboard
│       ├── mini-*.lua               # Mini.nvim plugins
│       ├── nvim-surround.lua        # Surround operations
│       ├── vim-illuminate.lua       # Highlight references
│       ├── marks.lua                # Mark indicators
│       ├── neotest.lua              # Testing framework
│       ├── tailwind-tools.lua       # Tailwind CSS support
│       ├── ts-error-translator.lua  # TypeScript error translation
│       ├── update-notifier.lua      # Config update notifications
│       └── color-themes.lua         # Color schemes
└── lsp/
    ├── jsonls.lua                   # JSON LSP config
    ├── lua_ls.lua                   # Lua LSP config
    ├── marksman.lua                 # Markdown LSP config
    ├── svelte.lua                   # Svelte LSP config
    └── vtsls.lua                    # TypeScript/JavaScript LSP config
```

## Core Settings

### Leader Keys

- **Leader**: `Space`
- **Local Leader**: `Space`

### Editor Options

- **Tabs**: 2 spaces
- **Line numbers**: Relative + absolute
- **Folding**: LSP-based with native Neovim 0.11
- **Auto-save formatting**: Enabled
- **Sign column**: Auto-expands up to 2 columns (for marks + diagnostics/git)
- **Update time**: 300ms
- **Scroll offset**: 8 lines

## Status Bar

This configuration uses a custom native statusline (not a plugin) that displays:

**Left side:**

- Relative file path
- Help buffer flag `[Help]`
- Modified flag `[+]`
- Readonly flag `[RO]`
- LSP diagnostics counts (errors, warnings, info, hints with icons)

**Right side:**

- Current line and column `line,col`
- Virtual column (if different from physical column)
- Percentage through file

### Statusline Special Characters Reference

| Code       | Description                                                       |
| ---------- | ----------------------------------------------------------------- |
| `%<`       | Truncation point - if line is too long, truncate from here        |
| `%f`       | File path relative to current directory                           |
| `%F`       | Full file path                                                    |
| `%t`       | File name (tail) only                                             |
| `%h`       | Help buffer flag - shows `[Help]` if in help buffer               |
| `%m`       | Modified flag - shows `[+]` if buffer has unsaved changes         |
| `%r`       | Readonly flag - shows `[RO]` if file is readonly                  |
| `%w`       | Preview window flag - shows `[Preview]`                           |
| `%y`       | File type - shows `[vim]`, `[lua]`, etc.                          |
| `%{expr}`  | Evaluate vimscript expression and insert result                   |
| `%{%...%}` | Evaluate expression - same as `%{}` but allows `%` inside         |
| `v:lua.`   | Call a Lua function from statusline (requires `%{%...%}` wrapper) |
| `%=`       | Separation point - items after this are right-aligned             |
| `%(...)`   | Group items - useful for conditional display or spacing           |
| `%l`       | Current line number                                               |
| `%L`       | Total number of lines in buffer                                   |
| `%c`       | Current column number (byte index)                                |
| `%v`       | Virtual column number (accounts for tabs)                         |
| `%V`       | Virtual column - only shown when different from `%c`              |
| `%P`       | Percentage through file (0%, 50%, 100%, etc.)                     |
| `%%`       | Literal `%` character                                             |

### Implementation

The statusline is configured in `lua/options.lua` using a Lua function for diagnostics and native Neovim statusline syntax:

```lua
-- Diagnostics function - shows LSP error/warning/info/hint counts
_G.statusline_diagnostics = function()
  local counts = vim.diagnostic.count(0)
  local parts = {}

  if counts[vim.diagnostic.severity.ERROR] then
    table.insert(parts, "  " .. counts[vim.diagnostic.severity.ERROR])
  end
  if counts[vim.diagnostic.severity.WARN] then
    table.insert(parts, "  " .. counts[vim.diagnostic.severity.WARN])
  end
  if counts[vim.diagnostic.severity.INFO] then
    table.insert(parts, "  " .. counts[vim.diagnostic.severity.INFO])
  end
  if counts[vim.diagnostic.severity.HINT] then
    table.insert(parts, "  " .. counts[vim.diagnostic.severity.HINT])
  end

  return #parts > 0 and " " .. table.concat(parts, " ") .. " " or ""
end

-- Statusline format
vim.opt.statusline = "%<%f %h%m%r%{%v:lua.statusline_diagnostics()%}%=%((%l,%c%V %) %P"
```

The diagnostics function is called from the statusline using `%{%v:lua.statusline_diagnostics()%}` syntax, which allows calling Lua functions and using `%` characters within the function.

## Key Bindings

### General

| Key         | Mode | Action         |
| ----------- | ---- | -------------- |
| `<leader>w` | n    | Save file      |
| `<leader>W` | n    | Save all files |
| `<leader>q` | n    | Quit           |
| `<leader>Q` | n    | Quit all       |
| `<leader>a` | n    | Select all     |

### Window Navigation

| Key         | Mode | Action                 |
| ----------- | ---- | ---------------------- |
| `<C-h>`     | n    | Go to left window      |
| `<C-j>`     | n    | Go to lower window     |
| `<C-k>`     | n    | Go to upper window     |
| `<C-l>`     | n    | Go to right window     |
| `<M-Up>`    | n    | Increase window height |
| `<M-Down>`  | n    | Decrease window height |
| `<M-Left>`  | n    | Decrease window width  |
| `<M-Right>` | n    | Increase window width  |

### Horizontal Scrolling

| Key     | Mode | Action       |
| ------- | ---- | ------------ |
| `<M-h>` | n    | Scroll right |
| `<M-l>` | n    | Scroll left  |

**Note:** Can hold these keys for continuous scrolling. Default Neovim keys (`zh`, `zl`, `zH`, `zL`) also available.

### Buffer Management

| Key          | Mode | Action          |
| ------------ | ---- | --------------- |
| `<leader>bd` | n    | Delete buffer   |
| `<leader>bn` | n    | Next buffer     |
| `<leader>bp` | n    | Previous buffer |

### Editing

| Key         | Mode | Action                         |
| ----------- | ---- | ------------------------------ |
| `<`         | v    | Indent left (keeps selection)  |
| `>`         | v    | Indent right (keeps selection) |
| `Alt+j`     | n    | Move line down                 |
| `Alt+k`     | n    | Move line up                   |
| `Alt+j`     | v    | Move text down                 |
| `Alt+k`     | v    | Move text up                   |
| `<leader>p` | x    | Paste without yanking          |
| `<leader>d` | n/v  | Delete without yanking         |
| `<leader>y` | n/v  | Yank to system clipboard       |

### LSP (Language Server Protocol)

**Neovim 0.11+ Default Keybindings:**

| Key     | Mode | Action              |
| ------- | ---- | ------------------- |
| `grr`   | n    | References          |
| `gra`   | n, v | Code action         |
| `grn`   | n    | Rename              |
| `gri`   | n    | Implementation      |
| `grt`   | n    | Type definition     |
| `gO`    | n    | Document symbols    |
| `K`     | n    | Hover documentation |
| `<C-s>` | i    | Signature help      |

**Additional Keybindings:**

| Key          | Mode | Action                           |
| ------------ | ---- | -------------------------------- |
| `gd`         | n    | Go to definition                 |
| `gD`         | n    | Go to declaration                |
| `<leader>gv` | n    | Definition (vertical split)      |
| `<leader>gh` | n    | Definition (horizontal split)    |
| `<leader>gt` | n    | Definition (new tab)             |
| `<leader>th` | n    | Toggle inlay hints               |

### Diagnostics

| Key          | Mode | Action                |
| ------------ | ---- | --------------------- |
| `[d`         | n    | Previous diagnostic   |
| `]d`         | n    | Next diagnostic       |
| `gl`         | n    | Show diagnostic float |
| `<leader>ld` | n    | Diagnostic list       |

### Fuzzy Finding (FZF-lua)

| Key                | Mode | Action                |
| ------------------ | ---- | --------------------- |
| `<leader><leader>` | n    | Resume last search    |
| `<leader>ff`       | n    | Find files            |
| `<leader>fg`       | n    | Live grep             |
| `<leader>fb`       | n    | Find buffers          |
| `<leader>fh`       | n    | Help tags             |
| `<leader>fo`       | n    | Recent files          |
| `<leader>fc`       | n    | Commands              |
| `<leader>fk`       | n    | Keymaps               |
| `<leader>fr`       | n    | LSP references        |
| `<leader>fs`       | n    | Document symbols      |
| `<leader>fw`       | n    | Workspace symbols     |
| `<leader>fd`       | n    | Document diagnostics  |
| `<leader>fD`       | n    | Workspace diagnostics |
| `<leader>fm`       | n    | Git modified files    |

**Within FZF window:**

| Key     | Action                       |
| ------- | ---------------------------- |
| `Tab`   | Mark/unmark item             |
| `Alt-a` | Select all                   |
| `Alt-d` | Deselect all                 |
| `Enter` | Accept (open selected items) |

**Note:** LSP navigation uses Neovim defaults (`grr`, `gra`, `grn`, etc.). Use `<leader>f*` mappings above for fuzzy finder versions.

### File Explorer (nvim-tree)

| Key         | Mode | Action               |
| ----------- | ---- | -------------------- |
| `<leader>e` | n    | Open at current file |
| `<leader>E` | n    | Toggle explorer      |

### Git (Gitsigns)

| Key          | Mode | Action                    |
| ------------ | ---- | ------------------------- |
| `]c`         | n    | Next git hunk             |
| `[c`         | n    | Previous git hunk         |
| `<leader>hs` | n/v  | Stage hunk                |
| `<leader>hr` | n/v  | Reset hunk                |
| `<leader>hS` | n    | Stage buffer              |
| `<leader>hR` | n    | Reset buffer              |
| `<leader>hp` | n    | Preview hunk              |
| `<leader>hb` | n    | Blame line                |
| `<leader>tb` | n    | Toggle git blame          |
| `<leader>hd` | n    | Diff this                 |
| `ih`         | o/x  | Select hunk (text object) |

### Git (Fugitive)

| Key          | Mode | Action     |
| ------------ | ---- | ---------- |
| `<leader>gs` | n    | Git status |
| `<leader>gc` | n    | Git commit |
| `<leader>gp` | n    | Git push   |
| `<leader>gl` | n    | Git pull   |

### Formatting & Linting

| Key          | Mode | Action               |
| ------------ | ---- | -------------------- |
| `<leader>cf` | n/v  | Format file or range |
| `<leader>cl` | n    | Trigger linting      |

### Diagnostics UI (Trouble)

| Key          | Mode | Action                    |
| ------------ | ---- | ------------------------- |
| `<leader>xx` | n    | Toggle diagnostics        |
| `<leader>xX` | n    | Toggle buffer diagnostics |
| `<leader>xl` | n    | Location list             |
| `<leader>xq` | n    | Quickfix list             |
| `<leader>xs` | n    | Symbols                   |
| `<leader>xL` | n    | LSP references            |

### Testing (Neotest)

| Key          | Mode | Action              |
| ------------ | ---- | ------------------- |
| `<leader>tt` | n    | Run nearest test    |
| `<leader>tf` | n    | Run test file       |
| `<leader>ts` | n    | Toggle test summary |
| `<leader>to` | n    | Show test output    |

### Completion & Snippets

Powered by blink.cmp with LuaSnip integration.

| Key                | Mode | Action                           |
| ------------------ | ---- | -------------------------------- |
| `<C-space>`        | i    | Show completion                  |
| `<C-y>`            | i    | Accept completion                |
| `<C-e>`            | i    | Cancel completion                |
| `<C-n>` / `<Down>` | i    | Next completion                  |
| `<C-p>` / `<Up>`   | i    | Previous completion              |
| `<C-b>` / `<C-f>`  | i    | Scroll documentation up/down     |
| `<Tab>`            | i/s  | Jump to next snippet placeholder |
| `<S-Tab>`          | i/s  | Jump to previous placeholder     |
| `<C-l>`            | i/s  | Change choice in snippet         |

**Features:** Ghost text preview, auto-show documentation, LSP/snippet/path/buffer sources

### Navigation (vim-illuminate)

| Key  | Mode | Action             |
| ---- | ---- | ------------------ |
| `]]` | n    | Next reference     |
| `[[` | n    | Previous reference |

### Navigation (Flash)

| Key          | Mode  | Action              |
| ------------ | ----- | ------------------- |
| `<leader>fj` | n/x/o | Flash jump          |
| `<leader>fJ` | n/x/o | Flash treesitter    |
| `<leader>fr` | o     | Remote flash        |
| `<leader>fR` | n/x/o | Treesitter search   |
| `<c-s>`      | c     | Toggle flash search |

### Snacks

| Key          | Mode | Action                        |
| ------------ | ---- | ----------------------------- |
| `<leader>un` | n    | Dismiss all notifications     |
| `<leader>nh` | n    | Notification history          |
| `<c-/>`      | n/t  | Toggle terminal               |
| `<c-_>`      | n/t  | Toggle terminal (alternative) |

### UI Toggles

| Key          | Mode | Action                                                            |
| ------------ | ---- | ----------------------------------------------------------------- |
| `<leader>uf` | n    | Toggle autoformat                                                 |
| `<leader>ul` | n    | Toggle auto-lint                                                  |
| `<leader>up` | n    | Toggle auto-pairs                                                 |
| `<leader>ud` | n    | Toggle diagnostic display (cycles: virtual lines → text → minimal) |
| `<leader>uu` | n    | Toggle auto-update (config, plugins, Treesitter, Mason registry)  |
| `<leader>uw` | n    | Toggle line wrap                                                  |
| `<leader>th` | n    | Toggle inlay hints                                                |
| `<leader>tb` | n    | Toggle git blame                                                  |

**Diagnostic Display Modes:**
- **Virtual Lines**: Diagnostics shown as separate full lines below the code (default)
- **Virtual Text**: Diagnostics shown inline at the end of the line
- **Minimal**: Only underlines and signs shown; view full errors with `gl` or by navigating to diagnostic

## Plugins

### Plugin Manager

- **lazy.nvim**: Fast and modern plugin manager

### LSP & Language Support

- **Native LSP**: Uses Neovim 0.11+ `vim.lsp.config` API
- **mason.nvim**: LSP/formatter/linter installer

### Completion & Snippets

- **blink.cmp**: Fast completion engine (replaces nvim-cmp)
- **LuaSnip**: Snippet engine
- **friendly-snippets**: Collection of snippets

### Syntax & Parsing

- **nvim-treesitter**: Syntax highlighting and parsing
- **nvim-treesitter-textobjects**: Smart text objects
- **nvim-ts-autotag**: Auto-close HTML/JSX tags
- **nvim-ts-context-commentstring**: Context-aware commenting

### Navigation & Search

- **fzf-lua**: Fuzzy finder and search
- **nvim-tree.lua**: File explorer
- **trouble.nvim**: Diagnostics and location list

### Git Integration

- **gitsigns.nvim**: Git decorations and hunk operations
- **vim-fugitive**: Git commands wrapper

### Formatting & Linting

- **conform.nvim**: Async formatting (prettierd, eslint_d, stylua)
- **nvim-lint**: Async linting (eslint_d)

### Editing Enhancements

- **flash.nvim**: Navigate with search labels and enhanced motions
- **nvim-surround**: Surround text objects
- **mini.ai**: Enhanced text objects with treesitter
- **mini.pairs**: Auto-pairing brackets
- **mini.basics**: Sensible defaults
- **mini.bracketed**: Navigate with `[` and `]`
- **mini.indentscope**: Indent scope visualization

### UI Enhancements

- **snacks.nvim**: Notifications, smooth scrolling, dashboard, terminal integration
- **which-key.nvim**: Keymap hints
- **vim-illuminate**: Highlight word references
- **nvim-web-devicons**: File icons

### TypeScript/React/Web Development

- **tailwind-tools.nvim**: Tailwind CSS utilities
- **ts-error-translator.nvim**: Readable TypeScript errors

### Testing

- **neotest**: Testing framework
- **neotest-vitest**: Vitest adapter

### Themes

- **github-nvim-theme**: GitHub theme (active: dark_dimmed)
- **catppuccin/nvim**: Catppuccin theme
- **kanagawa.nvim**: Kanagawa theme
- **monokai-pro.nvim**: Monokai Pro theme
- **onedark.nvim**: Atom One Dark theme
- **rose-pine/neovim**: Rosé Pine theme
- **tokyonight.nvim**: Tokyo Night theme

## Language Servers

### TypeScript/JavaScript (vtsls)

- Complete function calls
- Inlay hints for parameters, types, return types
- Supports React, Vue, Svelte

### Lua (lua_ls)

- Neovim-specific configuration
- Vim API awareness
- LuaJIT runtime

## Formatters & Linters

### Formatters (via conform.nvim)

- **Lua**: stylua
- **JavaScript/TypeScript**: eslint_d → prettierd (in sequence)
- **Vue/Svelte**: eslint_d → prettierd
- **HTML/CSS/JSON/YAML**: prettierd

### Linters (via nvim-lint)

- **JavaScript/TypeScript/Vue/Svelte**: eslint_d

## Customization

### Change Color Scheme

Edit `lua/plugins/color-themes.lua`:

```lua
-- Change this line in the tokyonight config:
vim.cmd([[colorscheme tokyonight-night]])

-- To one of:
vim.cmd([[colorscheme tokyonight-storm]])
vim.cmd([[colorscheme tokyonight-day]])
vim.cmd([[colorscheme github_dark_dimmed]]) -- or github_light, github_dark_high_contrast, etc.
vim.cmd([[colorscheme catppuccin]])
vim.cmd([[colorscheme kanagawa]])
vim.cmd([[colorscheme onedark]])
vim.cmd([[colorscheme rose-pine]])
vim.cmd([[colorscheme monokai-pro]])
```

### Add Custom LSP Server

1. Create config file: `lsp/your_server.lua`
2. Add server settings:

```lua
return {
  settings = {
    -- Your server settings
  },
}
```

3. Add to `ensure_installed` in `lua/plugins/lsp-config.lua`

### Change Leader Key

The leader key is currently set to `Space`. To change it, edit `lua/options.lua`:

```lua
vim.g.mapleader = "\\"  -- Change to backslash or any other key
```

### Enable Inlay Hints

Uncomment in `lua/options.lua`:

```lua
vim.lsp.inlay_hint.enable(true)
```

Or toggle with `<leader>th`

### Disable Auto-format on Save

Edit `lua/plugins/conform.lua`:

```lua
opts = {
  formatters_by_ft = { ... },
  -- format_on_save = false,  -- Disable
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
},
```

## Updating

### Automatic Update Notifications

NeoJim automatically checks for and installs updates on startup (can be toggled with `<leader>uu`). When auto-update is enabled, the following are automatically updated:

- **Configuration**: Checks for new commits and notifies if updates are available
- **Plugins**: Updates all lazy.nvim plugins in the background
- **Treesitter parsers**: Updates all installed language parsers silently (only notifies if updates occur)
- **Mason registry**: Refreshes the registry to check for package updates (run `:MasonUpdateAll` to install updates)

Toggle auto-update with `<leader>uu` to enable/disable this behavior. The setting persists across sessions.

**Note:** Mason packages are not auto-installed on startup to avoid slowdowns. Use `:MasonUpdateAll` to update all packages, or open `:Mason` and press `U`.

### Manual Update

**Configuration:**

```vim
:UpdateConfig
```

This command will:
1. Check for uncommitted changes (and warn if any exist)
2. Pull the latest changes from the remote repository
3. Prompt you to restart Neovim to apply the updates

**Note:** Make sure to commit or stash any local changes before updating to avoid conflicts.

**Mason Packages:**

```vim
:MasonUpdateAll   " Update all installed LSP servers, formatters, and linters
```

Or open `:Mason` and press `U` to update all packages interactively.

## Troubleshooting

### Plugins not loading

```vim
:Lazy sync
:Lazy clean
:Lazy update
```

### LSP not working

1. Check LSP is running:

```vim
:lua vim.print(vim.lsp.get_clients({ bufnr = 0 }))
```

2. Check Mason installations:

```vim
:Mason
```

3. Check health:

```vim
:checkhealth vim.lsp
```

### Completion not showing

1. Check blink.cmp is loaded:

```vim
:lua print(vim.inspect(require("blink.cmp")))
```

2. Verify LuaSnip is working:

```vim
:lua print(vim.inspect(require("luasnip").available()))
```

### Formatting not working

1. Check formatters are installed via Mason
2. Verify file type is configured in `lua/plugins/conform.lua`
3. Manual format: `<leader>cf`

### Git signs not showing

1. Make sure you're in a git repository
2. Check gitsigns status:

```vim
:Gitsigns toggle_signs
```

## Performance Tips

1. **Lazy loading**: Most plugins are already configured to lazy load
2. **Large files**: Treesitter auto-disables for files > 2000 lines
3. **Disable unused plugins**: Comment out plugins in `lua/plugins/` you don't need
4. **Update plugins regularly**: `:Lazy sync`

## Project Structure for Web Development

Recommended project setup:

```
your-project/
├── .eslintrc.js          # ESLint config
├── .prettierrc           # Prettier config
├── tsconfig.json         # TypeScript config
├── package.json
└── src/
    └── ...
```

### ESLint + Prettier Integration

Make sure your project has `eslint-config-prettier` to prevent conflicts:

```bash
npm install -D eslint-config-prettier
```

In `.eslintrc.js`:

```js
module.exports = {
  extends: [
    "eslint:recommended",
    "prettier", // Must be last
  ],
};
```

## Contributing

This is a personal configuration, but feel free to fork and customize for your needs.

## License

MIT

## Credits

Built with inspiration from:

- LazyVim
- NvChad
- Neovim community

---

**Author**: James
**Version**: 1.0.0
**Last Updated**: 2025-12-21
