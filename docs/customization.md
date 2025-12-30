# Customization

Learn how to customize this configuration to match your preferences.

## Changing the Color Scheme

### Available Themes

This configuration includes 7 color schemes:

- **GitHub** - 10+ variants (light, dark, dark_dimmed, etc.)
- **Tokyo Night** - night, storm, day, moon
- **Catppuccin** - latte, frappe, macchiato, mocha
- **Rose Pine** - main, moon, dawn
- **Kanagawa** - wave, dragon, lotus
- **Monokai Pro** - classic, octagon, pro, machine, ristretto, spectrum
- **One Dark** - dark, darker, cool, deep, warm, warmer

### How to Change

Edit `lua/plugins/color-themes.lua`:

```lua
-- Find this line (around line 52):
vim.cmd([[colorscheme github_dark_dimmed]])

-- Change to one of:
vim.cmd([[colorscheme tokyonight-night]])
vim.cmd([[colorscheme tokyonight-storm]])
vim.cmd([[colorscheme catppuccin]])
vim.cmd([[colorscheme rose-pine]])
vim.cmd([[colorscheme kanagawa]])
vim.cmd([[colorscheme onedark]])
vim.cmd([[colorscheme monokai-pro]])
```

Save and restart Neovim.

## Changing the Leader Key

The leader key is currently set to **Space**. To change it:

Edit `lua/options.lua`:

```lua
-- Change from Space to backslash
vim.g.mapleader = "\\"

-- Or to comma
vim.g.mapleader = ","
```

**Warning**: Many keybindings in this config assume Space as leader. You may need to update documentation and muscle memory.

## Adding a New LSP Server

### 1. Create Server Configuration

Create a new file in `lsp/`:

```lua
-- lsp/rust_analyzer.lua
return {
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}
```

### 2. Add to LSP Config

Edit `lua/plugins/lsp-config.lua`:

```lua
local servers = {
  "lua_ls",
  "vtsls",
  "svelte",
  "rust_analyzer",  -- Add your server
}
```

### 3. Install via Mason

```vim
:Mason
```

Search for and install your LSP server.

### 4. Restart Neovim

```bash
nvim
```

## Adding Keybindings

### Method 1: Add to options.lua

Edit `lua/options.lua`:

```lua
-- Add your custom keymaps
vim.keymap.set("n", "<leader>hw", ":echo 'Hello World'<CR>",
  { desc = "Say hello" })
```

### Method 2: Add to Plugin Config

If the keymap is plugin-specific, add it to that plugin's config file:

```lua
-- In lua/plugins/your-plugin.lua
return {
  "plugin/name",
  keys = {
    { "<leader>x", ":PluginCommand<CR>", desc = "Run plugin command" },
  },
}
```

### Method 3: Add to which-key

For organized keybinding groups, edit `lua/plugins/which-key.lua`:

```lua
require("which-key").add({
  { "<leader>m", group = "My Commands" },
  { "<leader>mh", ":echo 'Hello'<CR>", desc = "Say hello" },
  { "<leader>mg", ":echo 'Goodbye'<CR>", desc = "Say goodbye" },
})
```

## Customizing Formatting

### Change Formatters

Edit `lua/plugins/conform.lua`:

```lua
formatters_by_ft = {
  lua = { "stylua" },
  javascript = { "eslint_d", "prettierd" },  -- Runs in sequence
  typescript = { "eslint_d", "prettierd" },
  -- Add your own:
  python = { "black", "isort" },
  rust = { "rustfmt" },
}
```

### Disable Auto-format on Save

Edit `lua/plugins/conform.lua`:

```lua
-- Comment out or remove:
format_on_save = function()
  if not vim.g.autoformat then
    return
  end
  return { timeout_ms = 500, lsp_fallback = true }
end,
```

Or toggle it dynamically with `<leader>uf`.

### Format-Specific Settings

Create formatter configs:

```lua
formatters = {
  prettierd = {
    prepend_args = { "--tab-width", "4" },  -- Use 4 spaces
  },
}
```

## Customizing Linting

Edit `lua/plugins/nvim-lint.lua`:

```lua
linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  -- Add your own:
  python = { "pylint" },
  sh = { "shellcheck" },
}
```

## Changing Tab/Indent Size

Edit `lua/options.lua`:

```lua
-- Change from 2 to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
```

## Enabling Inlay Hints

TypeScript inlay hints show inline type information.

### Enable by Default

Edit `lua/options.lua`:

```lua
-- Add this line (around line 50):
vim.lsp.inlay_hint.enable(true)
```

### Toggle Manually

Use the keymap:

```
<leader>th
```

## Adding Plugins

### 1. Create Plugin Config

Create a new file in `lua/plugins/`:

```lua
-- lua/plugins/my-plugin.lua
return {
  "username/plugin-name",
  event = "VeryLazy",  -- When to load
  opts = {
    -- Plugin options
  },
  config = function()
    -- Setup code
  end,
}
```

### 2. Restart Neovim

lazy.nvim will automatically detect and install the new plugin.

### 3. Update Documentation

See [CLAUDE.md](https://github.com/jjohnson1994/neojim/blob/main/CLAUDE.md) for documentation requirements.

## Removing Plugins

### 1. Delete Plugin File

Remove or comment out the plugin file in `lua/plugins/`:

```bash
# Delete
rm lua/plugins/unwanted-plugin.lua

# Or move to backup
mv lua/plugins/unwanted-plugin.lua lua/plugins/unwanted-plugin.lua.bak
```

### 2. Clean Up

```vim
:Lazy clean
```

### 3. Remove Related Keybindings

Search for and remove any keybindings in:

- `lua/options.lua`
- `lua/plugins/which-key.lua`

## Customizing Statusline

The statusline is defined in `lua/options.lua`:

```lua
-- Modify the statusline format string
vim.opt.statusline = "%<%f %h%m%r%{%v:lua.statusline_diagnostics()%}%=%((%l,%c%V) %) %P"

-- Add git branch:
vim.opt.statusline = "%{FugitiveHead()} %<%f %h%m%r%{%v:lua.statusline_diagnostics()%}%=%((%l,%c%V) %) %P"
```

See [Statusline documentation](/statusline) for format codes.

## Customizing Completion

Edit `lua/plugins/blink.lua`:

```lua
opts = {
  keymap = {
    preset = "default",
    -- Change completion key:
    ["<C-space>"] = { "show", "hide" },
    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
  },

  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = "mono",
  },

  -- More options...
}
```

## File-Specific Settings

Create file-type specific configs:

```lua
-- In lua/options.lua or create after/ftplugin/python.lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})
```

## Environment Variables

Set environment variables for plugins:

```lua
-- In init.lua or lua/options.lua
vim.env.MY_VAR = "value"
```

## Disabling Features

### Disable Auto-pairs

```
<leader>up
```

Or edit `lua/plugins/mini-pairs.lua` to disable by default.

### Disable Treesitter for Large Files

Already configured in `lua/plugins/treesitter.lua`:

```lua
disable = function(lang, buf)
  local max_filesize = 100 * 1024 -- 100 KB
  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
  if ok and stats and stats.size > max_filesize then
    return true
  end
end,
```

## Project-Specific Settings

Create `.nvim.lua` in your project root:

```lua
-- .nvim.lua
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

-- Project-specific keymaps
vim.keymap.set("n", "<leader>pr", ":!npm run dev<CR>")
```

Then add to Neovim:

```lua
-- In lua/options.lua
vim.opt.exrc = true  -- Enable local .nvim.lua files
```

**Security note**: Only use with trusted projects.

## Next Steps

- [View All Keybindings](/keybindings)
- [Explore Plugins](/plugins)
- [Troubleshooting](/troubleshooting)
