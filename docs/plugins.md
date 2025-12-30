# Plugins

Complete reference of all plugins in this configuration.

## Plugin Manager

### lazy.nvim

**Fast and modern plugin manager**

- Lazy loading for optimal performance
- Automatic plugin installation
- Lock file for reproducible installs
- Profiling tools

**Commands:**
```vim
:Lazy sync       " Update all plugins
:Lazy clean      " Remove unused plugins
:Lazy profile    " View startup profiling
```

## LSP & Completion

### blink.cmp

**Performant, batteries-included completion plugin**

- Native Neovim 0.11+ implementation
- Fuzzy matching
- LSP completion source
- Snippet support via LuaSnip
- Fast and minimal

**File:** `lua/plugins/blink.lua`

### LuaSnip

**Snippet engine with friendly-snippets support**

- Fast snippet expansion
- VS Code style snippets
- Custom snippet support
- Choice nodes and dynamic text

**File:** `lua/plugins/luasnip.lua`

### nvim-lspconfig

**Quickstart configs for Neovim LSP**

- Pre-configured LSP servers
- Easy server setup
- Capabilities configuration

**File:** `lua/plugins/lsp-config.lua`

### mason.nvim

**Portable package manager for LSP servers, formatters, and linters**

- Easy installation UI
- Cross-platform support
- Automatic binary management

**Commands:**
```vim
:Mason           " Open Mason UI
:MasonUpdate     " Update Mason itself
```

**File:** `lua/plugins/lsp-config.lua`

## Syntax & Parsing

### nvim-treesitter

**Treesitter integration for better syntax highlighting**

- Incremental parsing
- Better syntax highlighting than regex
- Code understanding for text objects
- Auto-disable for large files (>2000 lines)

**Installed parsers:**
- lua, vim, javascript, typescript, tsx
- json, html, css, markdown, bash
- svelte, vue

**File:** `lua/plugins/treesitter.lua`

### nvim-treesitter-textobjects

**Syntax-aware text objects**

- Function text objects (`af`, `if`)
- Class text objects
- Conditional text objects
- Swap, move, and select with context awareness

**File:** `lua/plugins/treesitter.lua`

### nvim-ts-autotag

**Auto close and rename HTML/JSX tags**

- Automatically close tags when typing `>`
- Rename both opening and closing tags simultaneously
- Works with HTML, JSX, TSX, Vue, Svelte

**File:** `lua/plugins/treesitter.lua`

### nvim-ts-context-commentstring

**Set commentstring based on cursor location**

- Correct comments in JSX/TSX
- Context-aware comment strings
- Works with treesitter

**File:** `lua/plugins/treesitter.lua`

### ts-error-translator.nvim

**Translate TypeScript errors to plain English**

- More readable TypeScript errors
- Automatic translation in diagnostics
- Easier debugging

**File:** `lua/plugins/ts-error-translator.lua`

## Formatting

### conform.nvim

**Lightweight formatting with multiple formatter support**

- Async formatting
- Format on save (toggleable)
- Multiple formatters per filetype
- Fallback to LSP formatting

**Formatters:**
- Lua: `stylua`
- JavaScript/TypeScript: `eslint_d` → `prettierd`
- HTML/CSS/JSON/YAML: `prettierd`

**Keybindings:**
- `<leader>cf` - Format file/range
- `<leader>uf` - Toggle auto-format

**File:** `lua/plugins/conform.lua`

## Linting

### nvim-lint

**Asynchronous linter**

- Runs linters async
- Multiple linters per filetype
- Auto-lint on save and text change

**Linters:**
- JavaScript/TypeScript/Vue/Svelte: `eslint_d`

**Keybindings:**
- `<leader>cl` - Trigger linting

**File:** `lua/plugins/nvim-lint.lua`

## Git Integration

### gitsigns.nvim

**Git decorations, hunks, and blame**

- Git signs in sign column
- Inline blame
- Stage/reset hunks
- Preview changes
- Text objects for hunks

**Keybindings:**
- `]c` / `[c` - Next/previous hunk
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line

**File:** `lua/plugins/gitsigns.lua`

### vim-fugitive

**Premier Git plugin for Vim/Neovim**

- Git commands from Neovim
- `:Git` command for any git operation
- Merge conflict resolution
- Git blame, diff, log

**Keybindings:**
- `<leader>gs` - Git status
- `<leader>gc` - Git commit
- `<leader>gp` - Git push
- `<leader>gl` - Git pull

**File:** `lua/plugins/fugitive.lua`

## File Navigation & Search

### fzf-lua

**Blazingly fast fuzzy finder**

- Find files, buffers, help tags
- Live grep with ripgrep
- LSP integration (references, symbols)
- Git integration
- Preview window

**Keybindings:**
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Buffers
- `<leader>fr` - LSP references
- See [Keybindings](/keybindings#fuzzy-finding-fzf-lua) for full list

**File:** `lua/plugins/fzf-lua.lua`

### nvim-tree.lua

**File explorer with git integration**

- Git status indicators
- File operations (create, delete, rename, move)
- Copy/paste
- Split support
- Auto-close

**Keybindings:**
- `<leader>e` - Open at current file
- `<leader>E` - Toggle explorer

**File:** `lua/plugins/nvim-tree.lua`

## Editing Enhancements

### flash.nvim

**Navigate code with search labels**

- Jump to any location with 2-3 keystrokes
- Treesitter integration
- Enhanced character motions
- Remote operations

**Keybindings:**
- `<leader>fj` - Flash jump
- `<leader>fJ` - Flash treesitter
- `<c-s>` - Toggle in search

**File:** `lua/plugins/flash.lua`

### nvim-surround

**Add/change/delete surrounding delimiter pairs**

- Surround with quotes, brackets, tags
- Change surroundings (`cs"'`)
- Delete surroundings (`ds"`)
- Visual mode support

**Examples:**
- `ysiw"` - Surround word with quotes
- `cs"'` - Change `"` to `'`
- `dst` - Delete surrounding tag

**File:** `lua/plugins/nvim-surround.lua`

### mini.ai

**Extended and enhanced text objects**

- Better around/inside text objects
- Treesitter integration
- Function, argument, tag text objects

**Examples:**
- `dif` - Delete inside function
- `caa` - Change around argument
- `vit` - Select inside tag

**File:** `lua/plugins/mini-ai.lua`

### mini.pairs

**Auto-pairs for brackets and quotes**

- Automatically insert closing pairs
- Smart deletion
- Toggle with `<leader>up`

**File:** `lua/plugins/mini-pairs.lua`

### mini.basics

**Common configuration presets**

- Sensible defaults
- Common keybindings
- Options configuration

**File:** `lua/plugins/mini-basics.lua`

### mini.bracketed

**Go forward/backward with `[` and `]`**

- Navigate buffers, hunks, diagnostics
- Consistent `[` / `]` navigation
- Many targets (buffers, files, quickfix, etc.)

**File:** `lua/plugins/mini-bracketed.lua`

## UI & Visual

### snacks.nvim

**Collection of QoL plugins**

Includes:
- **Notifier**: Beautiful notifications (replaces nvim-notify)
- **Scroll**: Smooth scrolling (replaces neoscroll)
- **Dashboard**: Startup dashboard
- **Terminal**: Floating terminal
- **And more**: bigfile, gitbrowse, quickfile, rename, words

**Keybindings:**
- `<leader>un` - Dismiss notifications
- `<leader>nh` - Notification history
- `<c-/>` - Toggle terminal

**File:** `lua/plugins/snacks.lua`

### which-key.nvim

**Display keybindings in a popup**

- Shows available keybindings as you type
- Group descriptions
- Searchable with `<leader>fk`

**File:** `lua/plugins/which-key.lua`

### trouble.nvim

**Pretty list for diagnostics, references, quickfix**

- Beautiful UI for diagnostics
- LSP references and symbols
- Quickfix and location lists
- Workspace diagnostics

**Keybindings:**
- `<leader>xx` - Toggle diagnostics
- `<leader>xX` - Buffer diagnostics
- `<leader>xl` - Location list

**File:** `lua/plugins/trouble.lua`

### vim-illuminate

**Automatically highlight other uses of word under cursor**

- LSP-based reference highlighting
- Visual feedback for word references
- Navigate with `]]` and `[[`

**File:** `lua/plugins/vim-illuminate.lua`

### mini.indentscope

**Visualize and work with indent scope**

- Shows current indent scope
- Visual indicator line
- Text object for indent scope

**File:** `lua/plugins/mini-indentscope.lua`

### marks.nvim

**View and interact with Vim marks**

- Visual mark indicators in sign column
- Mark previews
- Works alongside diagnostics and git signs

**File:** `lua/plugins/marks.lua`

### update-notifier

**Automatic config update notifications**

- Checks for updates on startup
- Notifies when new commits are available
- Provides `:UpdateConfig` command for easy updates
- Warns about uncommitted changes before updating
- Uses git fetch to check remote without blocking startup

**Commands:**
```vim
:UpdateConfig   " Pull latest config updates
```

**File:** `lua/plugins/update-notifier.lua`

## Testing

### neotest

**Extensible testing framework**

- Run tests from Neovim
- Visual test results
- Test output window
- Vitest adapter included

**Keybindings:**
- `<leader>tt` - Run nearest test
- `<leader>tf` - Run test file
- `<leader>ts` - Toggle test summary
- `<leader>to` - Show test output

**File:** `lua/plugins/neotest.lua`

## Specialized Tools

### tailwind-tools.nvim

**Tailwind CSS tooling**

- Color hints for Tailwind classes
- Class sorting
- Completions
- Utilities preview

**File:** `lua/plugins/tailwind-tools.lua`

## Colorschemes

### catppuccin

**Soothing pastel theme**

Variants: latte, frappe, macchiato, mocha

**File:** `lua/plugins/color-themes.lua`

### github-nvim-theme

**GitHub's Neovim theme**

**Default:** `github_dark_dimmed`

10+ variants including light, dark, high contrast, colorblind

**File:** `lua/plugins/color-themes.lua`

### kanagawa.nvim

**Inspired by the colors of the famous painting**

Variants: wave, dragon, lotus

**File:** `lua/plugins/color-themes.lua`

### monokai-pro.nvim

**Monokai Pro theme**

Multiple filter variants: classic, octagon, pro, machine, ristretto, spectrum

**File:** `lua/plugins/color-themes.lua`

### onedark.nvim

**Atom One Dark theme**

Style variants: dark, darker, cool, deep, warm, warmer

**File:** `lua/plugins/color-themes.lua`

### rose-pine

**All natural pine, faux fur and a bit of soho vibes**

Variants: main, moon, dawn

**File:** `lua/plugins/color-themes.lua`

### tokyonight.nvim

**Clean, dark Neovim theme**

Variants: night, storm, day, moon

**File:** `lua/plugins/color-themes.lua`

## Adding New Plugins

See the [Customization Guide](/customization#adding-plugins) for instructions on adding your own plugins.

## Plugin Performance

Check plugin load times:

```vim
:Lazy profile
```

This shows which plugins are taking the most time to load.
