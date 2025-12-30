# Claude Assistant Guidelines

This file contains important guidelines for Claude when helping maintain this Neovim configuration.

## Documentation Requirements

**CRITICAL: Always keep ALL documentation up to date!**

This configuration maintains **FOUR** documentation sources that MUST be kept in sync:
1. **README.md** - Quick reference and overview
2. **VitePress docs (`docs/`)** - Comprehensive web documentation
3. **Built-in Help (`doc/neojim.txt`)** - Vim help file for in-editor reference
4. **CLAUDE.md** - Internal guidelines and gotchas for maintainers

When making ANY changes to this configuration, you MUST update ALL RELEVANT documentation files across all four sources:

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

- ✅ **Update doc/neojim.txt** - Plugins section
  - Add/remove plugin from the appropriate category
  - Include description and key features
  - Keep categories matching README organization

- ✅ **Update CLAUDE.md** (this file)
  - Document any special considerations for the plugin
  - Add notes about plugin-specific gotchas or configuration requirements

### 2. Keymap Changes

When adding, removing, or modifying keymaps:

- ✅ **Update README.md** - Key Bindings section
  - Add/remove keymap from the appropriate subsection
  - Ensure the description is clear and concise
  - Keep keymaps organized by category (General, LSP, Git, etc.)

- ✅ **Update doc/neojim.txt** - Keybindings section
  - Add/remove keymap in the appropriate category
  - Use consistent formatting (key, mode, description)
  - Keep categories matching README organization

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

- ✅ **Update doc/neojim.txt** - LSP Servers section
  - Add/remove server with configuration details
  - Document features and supported file types
  - Update formatters/linters lists if applicable

### 4. Configuration Changes

When modifying core settings or options:

- ✅ **Update README.md** - Core Settings section
  - Document any changes to leader keys, editor options, or defaults

- ✅ **Update doc/neojim.txt** - Customization section
  - Document new settings and how to modify them
  - Include code examples where applicable

### 5. VitePress Documentation Updates

**CRITICAL: The VitePress documentation site must be kept in sync with all changes!**

When making ANY changes, update the relevant VitePress documentation in `docs/`:

#### Plugin Changes → Update VitePress

- ✅ **Update docs/plugins.md**
  - Add/remove plugin with full description
  - Include features, keybindings, file location, and usage examples
  - Keep alphabetically organized within categories

- ✅ **Update docs/features.md**
  - Add new features to appropriate sections
  - Update feature descriptions if plugin changes affect them

- ✅ **Update docs/getting-started.md** (if applicable)
  - Add installation steps for new dependencies
  - Update Mason package list if LSP/formatter/linter added

#### Keymap Changes → Update VitePress

- ✅ **Update docs/keybindings.md**
  - Add/remove keybindings in appropriate sections
  - Include mode, action description, and any special notes
  - Keep organized by category (LSP, Git, Navigation, etc.)
  - Update the "Cheat Sheet" section if adding common workflows

#### LSP Server Changes → Update VitePress

- ✅ **Update docs/lsp-servers.md**
  - Add/remove server documentation with full configuration details
  - Document features, settings, supported file types
  - Add troubleshooting notes if needed

- ✅ **Update docs/getting-started.md**
  - Add server to Mason installation list

#### Configuration/Settings Changes → Update VitePress

- ✅ **Update docs/configuration.md**
  - Document new settings, global variables, or configuration options
  - Include code examples showing how to use/modify settings

- ✅ **Update docs/customization.md**
  - Add examples showing how to customize the new feature
  - Include use cases and alternative approaches

#### General VitePress Updates

- ✅ **Always consider updating:**
  - **docs/troubleshooting.md** - Add common issues related to your changes
  - **docs/faq.md** - Add frequently asked questions about new features
  - **docs/README.md** - Update if VitePress structure/build process changes
  - **docs/index.md** - Update feature count or highlights for major changes

- ✅ **Update CLAUDE.md** (this file)
  - Document any new conventions, gotchas, or special considerations
  - Add plugin-specific notes for complex configurations
  - Update best practices based on lessons learned

#### VitePress Update Checklist

For each change, ask yourself:

1. ✅ Does this affect any existing documentation pages?
2. ✅ Should this be in the troubleshooting guide?
3. ✅ Would users ask about this in the FAQ?
4. ✅ Does this change any keybindings?
5. ✅ Does this require installation steps?
6. ✅ Are there new customization options?

**Remember:** VitePress docs are the primary documentation source - README.md is a quick reference, but VitePress should be comprehensive!

## Best Practices

1. **Test before documenting**: Ensure changes work correctly before updating docs
2. **Be thorough**: Don't skip any documentation steps - incomplete docs are worse than no docs
3. **Use clear descriptions**: Plugin and keymap descriptions should be concise but informative
4. **Maintain consistency**: Follow existing documentation patterns and formatting
5. **Alphabetize when possible**: Keep plugin lists, keymaps, and file structures organized
6. **Check for conflicts**: When adding keymaps, verify no conflicts exist with existing bindings
7. **Use latest APIs**: Always use the latest versions of Neovim and plugin APIs. Check the official Neovim documentation online at https://neovim.io/doc/ for the most current API methods. Avoid deprecated APIs and patterns.

## Git Commit Guidelines

When creating git commits:

1. **No AI attribution**: Do NOT add Claude Code attribution, Co-Authored-By lines, or any AI-related metadata to commit messages
2. **Keep commits clean**: Write concise, descriptive commit messages that focus on what changed and why
3. **Follow existing style**: Match the style and format of recent commits in the repository

## Common Mistakes to Avoid

- ❌ Adding a plugin without updating the README plugins list
- ❌ Adding a keymap without documenting it in the README
- ❌ Forgetting to update the File Structure section when adding new files
- ❌ Not updating which-key groups when introducing new keymap prefixes
- ❌ Leaving outdated information after removing plugins or keymaps
- ❌ Using `<space>` instead of `<leader>` in keymap definitions or documentation
- ❌ Using deprecated or outdated API methods instead of checking the latest Neovim/plugin documentation
- ❌ Adding Claude attribution or Co-Authored-By lines to git commits
- ❌ **Forgetting to update VitePress documentation in `docs/`** - This is the primary documentation!
- ❌ Updating README.md but not the corresponding VitePress pages
- ❌ Adding new features without updating docs/troubleshooting.md or docs/faq.md
- ❌ Not updating CLAUDE.md when introducing new patterns or gotchas

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

### update-notifier
- Automatically checks for config updates on VimEnter
- Uses async `vim.system()` for git operations to avoid blocking startup
- Runs `git fetch origin --quiet` to check for new commits
- Compares local HEAD with remote tracking branch using `git rev-list --count HEAD..@{u}`
- Only notifies if commits_behind > 0
- `:UpdateConfig` command checks for uncommitted changes before pulling
- Uses `git pull --rebase` to update configuration
- Notifications use snacks.nvim notify module
- Silent failures - doesn't show errors if not in git repo or no internet connection

## Remember

**Documentation is not optional** - it's a critical part of maintaining a usable configuration. Future you (and Claude) will thank present you for keeping everything up to date!

### CRITICAL: Four Documentation Sources MUST Stay in Sync

This configuration has **FOUR** documentation sources that must be updated together:

1. **VitePress docs (`docs/`)** - Primary comprehensive documentation (web-based)
   - Most detailed and user-friendly
   - Includes guides, tutorials, and full reference
   - Published to GitHub Pages

2. **README.md** - Quick reference and overview
   - First thing users see on GitHub
   - Should match VitePress content but more concise
   - Includes installation quick-start for all platforms

3. **Built-in Help (`doc/neojim.txt`)** - Vim help file
   - Accessible from within Neovim with `:help neojim`
   - Must follow Vim help file conventions
   - Should cover all major topics from VitePress/README

4. **CLAUDE.md** - Internal guidelines and gotchas
   - For maintainers and Claude assistant
   - Documents special considerations and conventions
   - Includes plugin-specific implementation notes

**When in doubt, update ALL FOUR!** Each serves a different audience and access pattern.

### Built-in Help File

The configuration includes a Vim help file at `doc/neojim.txt` that users can access with `:help neojim`.

**When to update the help file:**
- Adding/removing plugins
- Changing keybindings
- Modifying LSP configurations
- Adding customization options
- Updating troubleshooting steps

**After updating `doc/neojim.txt`, regenerate help tags:**
```bash
nvim --headless -c "helptags doc" -c "quit"
```

Or the tags will be automatically regenerated when Neovim starts.

### Documentation Sync Checklist

Before completing ANY change, verify all documentation is updated:

**For Plugin Changes:**
- [ ] README.md - Plugins section updated
- [ ] README.md - File Structure updated
- [ ] docs/plugins.md - Plugin added/removed with full details
- [ ] docs/getting-started.md - Mason installation list updated (if LSP/formatter/linter)
- [ ] doc/neojim.txt - Plugins section updated
- [ ] CLAUDE.md - Special considerations documented (if needed)

**For Keymap Changes:**
- [ ] README.md - Key Bindings section updated
- [ ] docs/keybindings.md - Keybinding added/removed
- [ ] doc/neojim.txt - Keybindings section updated
- [ ] lua/plugins/which-key.lua - Group registrations updated

**For LSP Server Changes:**
- [ ] README.md - Installation/File Structure updated
- [ ] docs/lsp-servers.md - Server documentation added/removed
- [ ] docs/getting-started.md - Mason installation list updated
- [ ] doc/neojim.txt - LSP Servers section updated
- [ ] lsp/ directory - Config file created/modified/removed
- [ ] lua/plugins/lsp-config.lua - Server added/removed from list

**For Configuration Changes:**
- [ ] README.md - Core Settings or relevant section updated
- [ ] docs/configuration.md - Setting documented with examples
- [ ] doc/neojim.txt - Customization section updated

**After ALL Documentation Updates:**
- [ ] Regenerate help tags: `nvim --headless -c "helptags doc" -c "quit"`
- [ ] Verify VitePress builds successfully (if changed)
- [ ] Double-check all four sources are consistent

**Remember:** It's better to over-document than under-document!
