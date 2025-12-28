# Claude Assistant Guidelines

This file contains important guidelines for Claude when helping maintain this Neovim configuration.

## Documentation Requirements

**CRITICAL: Always keep documentation up to date!**

When making ANY changes to this configuration, you MUST update the relevant documentation files:

### 1. Plugin Changes

When adding, removing, or modifying plugins:

- ✅ **Update README.md** - Plugins section
  - Add/remove plugin from the appropriate category
  - Include GitHub link and description
  - Keep categories organized (LSP, Syntax, Formatting, etc.)

- ✅ **Update README.md** - File Structure section
  - Add/remove plugin file from the directory tree
  - Keep files in alphabetical order within their directory

- ✅ **Update README.md** - Installation section (if applicable)
  - Add any new LSP servers, formatters, or linters to the Mason installation list

- ✅ **Update CLAUDE.md** (this file)
  - Document any special considerations for the plugin
  - Add notes about plugin-specific gotchas or configuration requirements

### 2. Keymap Changes

When adding, removing, or modifying keymaps:

- ✅ **Update README.md** - Key Bindings section
  - Add/remove keymap from the appropriate subsection
  - Ensure the description is clear and concise
  - Keep keymaps organized by category (General, LSP, Git, etc.)

- ✅ **Update which-key groups** in `lua/plugins/which-key.lua`
  - Add new group registrations if introducing a new `<leader>*` prefix
  - Remove obsolete group registrations
  - Ensure group names accurately reflect their purpose

### 3. LSP Server Changes

When adding, removing, or modifying LSP servers:

- ✅ **Update lsp/ directory**
  - Create/modify/remove the server config file (e.g., `lsp/svelte.lua`)

- ✅ **Update lua/plugins/lsp-config.lua**
  - Add/remove server from the `servers` list

- ✅ **Update README.md** - Installation section
  - Add/remove server from the Mason installation list

- ✅ **Update README.md** - File Structure section
  - Add/remove LSP config file from the lsp/ directory tree

### 4. Configuration Changes

When modifying core settings or options:

- ✅ **Update README.md** - Core Settings section
  - Document any changes to leader keys, editor options, or defaults

## Best Practices

1. **Test before documenting**: Ensure changes work correctly before updating docs
2. **Be thorough**: Don't skip any documentation steps - incomplete docs are worse than no docs
3. **Use clear descriptions**: Plugin and keymap descriptions should be concise but informative
4. **Maintain consistency**: Follow existing documentation patterns and formatting
5. **Alphabetize when possible**: Keep plugin lists, keymaps, and file structures organized
6. **Check for conflicts**: When adding keymaps, verify no conflicts exist with existing bindings
7. **Use latest APIs**: Always use the latest versions of Neovim and plugin APIs. Check the official Neovim documentation online at https://neovim.io/doc/ for the most current API methods. Avoid deprecated APIs and patterns.

## Common Mistakes to Avoid

- ❌ Adding a plugin without updating the README plugins list
- ❌ Adding a keymap without documenting it in the README
- ❌ Forgetting to update the File Structure section when adding new files
- ❌ Not updating which-key groups when introducing new keymap prefixes
- ❌ Leaving outdated information after removing plugins or keymaps
- ❌ Using `<space>` instead of `<leader>` in keymap definitions or documentation
- ❌ Using deprecated or outdated API methods instead of checking the latest Neovim/plugin documentation

## Configuration Notes

### Sign Column (signcolumn)
- Set to `auto:2` to allow up to 2 sign columns
- This prevents conflicts when multiple signs exist on the same line (e.g., marks + diagnostics, git signs + marks)
- Automatically shows/hides columns as needed
- If you need more than 2 signs on a line, increase to `auto:3`

### Diagnostic Signs
- Custom icons are defined for LSP diagnostics using the modern `vim.diagnostic.config()` API (Neovim 0.11+):
  - Error:  (circle with X)
  - Warning:  (triangle with exclamation)
  - Hint:  (lightbulb)
  - Info:  (info circle)
- Signs are configured via the `signs.text` table in `vim.diagnostic.config()`
- Icons require a Nerd Font to display correctly
- If icons don't display, check that your terminal is using a Nerd Font

## Plugin-Specific Notes

### snacks.nvim
- Unified quality-of-life plugin collection that replaces nvim-notify and neoscroll.nvim
- Provides multiple modules: notifier, scroll, dashboard, terminal, and more
- The notifier module replaces `vim.notify` in the init function
- Dashboard shows on startup when opening Neovim without a file
- Terminal can be toggled with `<c-/>` (or `<c-_>` as alternative)
- Some modules are disabled (indent, statuscolumn, words) as we use other plugins for those features
- Lazygit integration available through snacks (optional - requires lazygit installed)

### flash.nvim
- Modern navigation plugin using search labels and enhanced character motions
- Primary key is `<leader>fj` for jump mode - shows labels on search matches
- `<leader>fJ` for treesitter-aware navigation (jumps to syntax nodes)
- `<leader>fr` for remote flash (operator mode only)
- `<leader>fR` for treesitter search (operator/visual modes)
- Can be toggled in command mode with `<c-s>` during search

### marks.nvim
- Displays marks in the sign column with visual indicators
- Works alongside diagnostics and git signs thanks to `signcolumn = "auto:2"`
- Sign priority is configured: lower=10, upper=15, builtin=8, bookmark=20

### nvim-ts-autotag
- Requires standalone setup call with `opts` wrapper (not treesitter config)
- Must use latest API to avoid deprecation warnings

### blink.cmp
- Native Neovim 0.11+ completion that doesn't use nvim-cmp
- Capabilities are obtained via `require("blink.cmp").get_lsp_capabilities()`

### nvim-treesitter
- Treesitter parsers are installed for: lua, vim, javascript, typescript, tsx, json, html, css, markdown, bash, svelte, vue
- Auto-install is disabled - parsers must be explicitly listed

### conform.nvim (Auto-format Toggle)
- Auto-format on save is controlled by `vim.g.autoformat` global variable
- Default: enabled (`vim.g.autoformat = true`)
- Toggle with `<leader>uf` - shows notification when toggled
- Uses function-based `format_on_save` to check the global flag
- Manual formatting (`<leader>cf`) always works regardless of toggle state

## Remember

**Documentation is not optional** - it's a critical part of maintaining a usable configuration. Future you (and Claude) will thank present you for keeping everything up to date!
