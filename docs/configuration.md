# Configuration

This page describes the core configuration settings and how they're organized.

## File Structure

```
~/.config/nvim/
├── .stylua.toml                      # Stylua formatter config
├── init.lua                          # Entry point
├── CLAUDE.md                         # Guidelines for Claude assistant
├── README.md                         # Project readme
├── lua/
│   ├── options.lua                   # Core settings and keymaps
│   └── plugins/
│       ├── blink.lua                 # Completion engine
│       ├── luasnip.lua              # Snippet engine
│       ├── lsp-config.lua           # LSP + Mason config
│       ├── treesitter.lua           # Syntax highlighting
│       ├── conform.lua              # Formatting
│       ├── nvim-lint.lua            # Linting
│       ├── fzf-lua.lua              # Fuzzy finder
│       ├── nvim-tree.lua            # File explorer
│       ├── gitsigns.lua             # Git decorations
│       ├── fugitive.lua             # Git commands
│       ├── trouble.lua              # Diagnostics UI
│       ├── which-key.lua            # Keymap hints
│       ├── flash.lua                # Navigation
│       ├── snacks.lua               # QoL features
│       ├── mini-*.lua               # Mini.nvim plugins
│       ├── neotest.lua              # Testing
│       └── color-themes.lua         # Color schemes
└── lsp/
    ├── lua_ls.lua                   # Lua LSP config
    ├── vtsls.lua                    # TypeScript/JavaScript LSP
    └── svelte.lua                   # Svelte LSP
```

## Core Settings

### Leader Keys

```lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "
```

Both leader keys are set to **Space** for easy access.

### Editor Options

#### Indentation
```lua
vim.opt.tabstop = 2        -- Tab width
vim.opt.shiftwidth = 2     -- Indent width
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
```

#### Line Numbers
```lua
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
```

#### Search
```lua
vim.opt.ignorecase = true  -- Ignore case in search
vim.opt.smartcase = true   -- Unless uppercase is used
vim.opt.hlsearch = false   -- Don't highlight search results
```

#### Visual
```lua
vim.opt.termguicolors = true   -- True color support
vim.opt.signcolumn = "auto:2"  -- Auto sign column (up to 2)
vim.opt.wrap = false           -- Don't wrap lines
vim.opt.scrolloff = 8          -- Keep 8 lines visible above/below cursor
```

#### Performance
```lua
vim.opt.updatetime = 300      -- Faster completion
vim.opt.timeoutlen = 300      -- Faster which-key popup
```

#### Command Preview
```lua
vim.opt.inccommand = "nosplit"  -- Preview substitutions inline
```

Shows live preview of substitutions (`:s/old/new/g`) directly in the buffer as you type.

#### Folding (LSP-based)
```lua
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
vim.opt.foldlevelstart = 99   -- Start with all folds open
```

### Sign Column Configuration

The sign column is configured to auto-expand up to 2 columns:

```lua
vim.opt.signcolumn = "auto:2"
```

This prevents conflicts when multiple signs exist on the same line (e.g., marks + diagnostics, git signs + marks).

### Diagnostic Configuration

Custom diagnostic signs using modern Neovim 0.11 API:

```lua
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  virtual_text = false,
  virtual_lines = true,  -- Show diagnostics as separate virtual lines
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})
```

**Diagnostic Display Modes:**

The configuration supports three diagnostic display modes that can be toggled with `<leader>ud`:

1. **Virtual Lines** (default): Diagnostics shown as separate full lines in the buffer (similar to lsp_lines.nvim plugin), providing better visibility for multi-line error messages.
2. **Virtual Text**: Diagnostics shown inline at the end of the line.
3. **Minimal**: Only underlines and signs shown in the gutter. View full error messages with `gl` (show diagnostic float) or by navigating to the diagnostic location with `[d` or `]d`.

The selected mode persists across sessions. Press `<leader>ud` to cycle through modes: virtual lines → virtual text → minimal → virtual lines.

Icons require a Nerd Font to display correctly.

### Markdown-Specific Settings

Markdown files have enhanced settings for better reading and editing experience:

```lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 2      -- Conceal markdown syntax
    vim.opt_local.concealcursor = "nc"  -- Show syntax in insert/visual mode
    vim.opt_local.spell = true          -- Enable spell checking
    vim.opt_local.wrap = true           -- Wrap long lines
    vim.opt_local.linebreak = true      -- Break at word boundaries
  end,
})
```

These settings work with the render-markdown.nvim plugin to provide a beautiful reading experience. Toggle rendering with `<leader>mr`.

## Plugin Manager (lazy.nvim)

Plugins are managed by lazy.nvim with lazy loading for optimal performance.

### Plugin Loading Strategy

```lua
{
  "plugin-name",
  event = "VeryLazy",  -- Load after startup
  cmd = "Command",     -- Load on command
  keys = "<leader>x",  -- Load on keymap
  ft = "typescript",   -- Load for filetype
}
```

Most plugins are configured to load only when needed.

## LSP Configuration

LSP is configured in `lua/plugins/lsp-config.lua` using native Neovim LSP.

### LSP Servers

Available servers:
- **lua_ls**: Lua language server (Neovim-aware)
- **vtsls**: TypeScript/JavaScript (faster than tsserver)
- **svelte**: Svelte framework support

### Server-Specific Configs

Each server has its own config file in `lsp/`:

```lua
-- lsp/vtsls.lua
return {
  settings = {
    typescript = {
      inlayHints = {
        parameterNames = { enabled = "all" },
        -- ... more settings
      }
    }
  }
}
```

### Capabilities

LSP capabilities are provided by blink.cmp:

```lua
local capabilities = require("blink.cmp").get_lsp_capabilities()
```

## Auto-format on Save

Formatting is handled by conform.nvim and can be toggled:

```lua
-- Default: enabled
vim.g.autoformat = true

-- Toggle with <leader>uf
```

When enabled, files are formatted on save with the appropriate formatter.

## Treesitter Configuration

Treesitter provides syntax highlighting and code understanding:

```lua
ensure_installed = {
  "lua", "vim", "javascript", "typescript", "tsx",
  "json", "html", "css", "markdown", "bash",
  "svelte", "vue"
}
```

Auto-install is disabled - parsers must be explicitly listed.

## Completion Configuration

Completion is provided by blink.cmp, a native Neovim 0.11+ completion engine:

```lua
{
  "saghen/blink.cmp",
  dependencies = "L3MON4D3/LuaSnip",
  version = "*",
  opts = {
    keymap = {
      preset = "default",
      -- Custom mappings
    },
    -- ... more settings
  }
}
```

## Statusline

Custom statusline showing:
- File path
- Buffer flags (modified, readonly, help)
- LSP diagnostics (errors, warnings, info, hints)
- Cursor position
- File percentage

See [Statusline documentation](/statusline) for details.

## Global Variables

### Auto-format Toggle
```lua
vim.g.autoformat = true  -- Enable/disable auto-format on save
```

### Auto Update Toggle
```lua
vim.g.auto_update_check = true  -- Enable/disable automatic updates on startup
```

Toggle with `<leader>uu`. When enabled, NeoJim automatically updates the following on startup:
- **Config**: Checks for new commits from the remote repository
- **Plugins**: Updates all lazy.nvim plugins in the background
- **Treesitter parsers**: Updates all installed parsers silently (only notifies if updates occur)
- **Mason registry**: Refreshes to check for package updates (doesn't auto-install)

All updates run asynchronously without blocking startup. The toggle state persists across sessions.

**Note:** Mason packages are not auto-installed to avoid startup slowdowns. Use `:MasonUpdateAll` to update all packages.

### Leader Keys
```lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "
```

## Runtime Path

Neovim automatically sources files from:
- `init.lua` - Main entry point
- `lua/` - Lua modules
- `plugin/` - Auto-loaded plugins
- `after/plugin/` - Loaded after built-in plugins

## Next Steps

- [Customize Your Setup](/customization)
- [Learn Keybindings](/keybindings)
- [Explore Plugins](/plugins)
