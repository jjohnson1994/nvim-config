# Statusline

This configuration uses a **custom native statusline** (not a plugin) for maximum performance and simplicity.

## What It Shows

### Left Side

- **Relative file path**: File path from current directory
- **Help flag**: `[Help]` when viewing help files
- **Modified flag**: `[+]` when buffer has unsaved changes
- **Readonly flag**: `[RO]` when file is readonly
- **LSP diagnostics**: Error/warning/info/hint counts with icons

### Right Side

- **Current position**: `(line,col)` format
- **Virtual column**: Shown if different from physical column
- **File percentage**: How far through the file (0%, 50%, 100%)

## Example

```
init.lua [+]  2  1       (45,12) 23%
```

This shows:
- File: `init.lua`
- Modified: yes (`[+]`)
- Errors: 2 (red circle with X)
- Warnings: 1 (yellow triangle)
- Position: line 45, column 12
- Progress: 23% through file

## Implementation

The statusline is configured in `lua/options.lua`:

```lua
-- Diagnostics function
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
vim.opt.statusline = "%<%f %h%m%r%{%v:lua.statusline_diagnostics()%}%=%((%l,%c%V) %) %P"
```

## Format Codes Reference

| Code       | Description                                           |
| ---------- | ----------------------------------------------------- |
| `%<`       | Truncation point if line is too long                  |
| `%f`       | File path relative to current directory               |
| `%F`       | Full file path                                        |
| `%t`       | File name (tail) only                                 |
| `%h`       | Help buffer flag - shows `[Help]`                     |
| `%m`       | Modified flag - shows `[+]`                           |
| `%r`       | Readonly flag - shows `[RO]`                          |
| `%w`       | Preview window flag - shows `[Preview]`               |
| `%y`       | File type - shows `[vim]`, `[lua]`, etc.              |
| `%{expr}`  | Evaluate expression and insert result                 |
| `%{%...%}` | Evaluate expression (allows `%` inside)               |
| `v:lua.`   | Call Lua function (requires `%{%...%}` wrapper)       |
| `%=`       | Separation point - items after are right-aligned      |
| `%(...)`   | Group items                                           |
| `%l`       | Current line number                                   |
| `%L`       | Total lines in buffer                                 |
| `%c`       | Current column (byte index)                           |
| `%v`       | Virtual column (accounts for tabs)                    |
| `%V`       | Virtual column - only shown when different from `%c`  |
| `%P`       | Percentage through file                               |
| `%%`       | Literal `%` character                                 |

## Customization Examples

### Add Git Branch

```lua
vim.opt.statusline = "%{FugitiveHead()} %<%f %h%m%r%{%v:lua.statusline_diagnostics()%}%=%((%l,%c%V) %) %P"
```

Shows current git branch on the left.

### Add File Type

```lua
vim.opt.statusline = "%<%f %h%m%r%{%v:lua.statusline_diagnostics()%}%=%y %((%l,%c%V) %) %P"
```

Shows file type (e.g., `[lua]`) before position.

### Show Total Lines

```lua
vim.opt.statusline = "%<%f %h%m%r%{%v:lua.statusline_diagnostics()%}%=%((%l/%L,%c%V) %) %P"
```

Shows `45/320` instead of just `45`.

### Full Path Instead of Relative

```lua
-- Change %f to %F
vim.opt.statusline = "%<%F %h%m%r%{%v:lua.statusline_diagnostics()%}%=%((%l,%c%V) %) %P"
```

### File Name Only

```lua
-- Change %f to %t
vim.opt.statusline = "%<%t %h%m%r%{%v:lua.statusline_diagnostics()%}%=%((%l,%c%V) %) %P"
```

## Diagnostic Icons

The icons used for diagnostics require a **Nerd Font**:

| Icon | Severity | Unicode |
| ---- | -------- | ------- |
|   | ERROR    | U+F659  |
|   | WARN     | U+F071  |
|   | INFO     | U+F7FC  |
|   | HINT     | U+F835  |

### Changing Icons

Edit the `statusline_diagnostics` function in `lua/options.lua`:

```lua
_G.statusline_diagnostics = function()
  local counts = vim.diagnostic.count(0)
  local parts = {}

  -- Change icons here:
  if counts[vim.diagnostic.severity.ERROR] then
    table.insert(parts, "E:" .. counts[vim.diagnostic.severity.ERROR])
  end
  if counts[vim.diagnostic.severity.WARN] then
    table.insert(parts, "W:" .. counts[vim.diagnostic.severity.WARN])
  end
  -- ... etc
end
```

## Why Not a Plugin?

This configuration uses a native statusline instead of a plugin like lualine because:

1. **Performance**: Native statusline is instant
2. **Simplicity**: No plugin dependencies
3. **Customization**: Direct control with Lua
4. **Minimal**: Shows only what's needed
5. **Learning**: Understand Neovim's native features

## Using a Statusline Plugin

If you prefer a statusline plugin like **lualine.nvim**:

1. Create `lua/plugins/lualine.lua`:

```lua
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "auto",
      icons_enabled = true,
      component_separators = "|",
      section_separators = "",
    },
  },
}
```

2. Remove the statusline configuration from `lua/options.lua`

3. Restart Neovim

## Statusline Colors

The statusline uses these highlight groups:

- `StatusLine` - Active statusline
- `StatusLineNC` - Inactive statusline

Customize colors in your theme or with:

```lua
vim.api.nvim_set_hl(0, "StatusLine", {
  fg = "#ffffff",
  bg = "#1a1b26",
})
```

## Hide Statusline

To hide the statusline:

```lua
vim.opt.laststatus = 0  -- Never show
```

Options:
- `0` - Never
- `1` - Only if 2+ windows
- `2` - Always (default)
- `3` - Global statusline (Neovim 0.7+)

## Global Statusline

For a single statusline across all windows:

```lua
vim.opt.laststatus = 3
```

This shows one statusline at the bottom instead of one per window.

## Related

- [Configuration](/configuration)
- [Customization](/customization)
