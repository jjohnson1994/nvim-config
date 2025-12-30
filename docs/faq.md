# FAQ

Frequently asked questions about this Neovim configuration.

## General

### Why Neovim over VS Code?

- **Speed**: Neovim is significantly faster
- **Customization**: Complete control over your editor
- **Keyboard-first**: Navigate and edit without touching the mouse
- **Lightweight**: Minimal resource usage
- **Terminal-native**: Works over SSH and in terminal workflows
- **Learning**: Deeper understanding of your tools

### Why Neovim 0.11+?

This configuration uses modern Neovim 0.11+ features:

- Native LSP keybindings (`grr`, `gra`, `grn`)
- Modern diagnostic API
- Native inlay hints
- LSP-based folding
- Performance improvements
- Latest Lua API

### Can I use this with older Neovim?

No, this configuration requires Neovim 0.11+ for native LSP features. For older versions, you'd need to modify several files.

### Is this suitable for beginners?

Yes! This configuration:

- Works out of the box
- Includes which-key for discoverability
- Has comprehensive documentation
- Uses sensible defaults
- Follows modern best practices

### Why not use a distribution like LazyVim or NvChad?

This configuration is:

- **Simpler**: Minimal core with essential plugins
- **Educational**: Learn by understanding each piece
- **Customizable**: Easy to modify for your needs
- **Focused**: Optimized specifically for web development
- **Transparent**: No hidden magic or complex abstractions

That said, LazyVim and NvChad are excellent - use what works for you!

## Installation

### Do I need to backup my existing config?

**Yes!** Always backup before installing:

```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

### Can I try this without replacing my config?

Yes, use an alias:

```bash
alias nvim-test='NVIM_APPNAME=nvim-test nvim'
```

Then clone to `~/.config/nvim-test` and run with `nvim-test`.

### How long does first-time setup take?

- Plugin installation: 1-2 minutes
- Mason packages: 2-5 minutes
- Total: ~5-10 minutes

### Can I install this on Windows?

The configuration should work on Windows with WSL2 or Git Bash, but it's primarily tested on macOS and Linux.

## Plugins

### Why blink.cmp instead of nvim-cmp?

**blink.cmp** is:

- Native Neovim 0.11+ implementation
- Faster performance
- Less configuration needed
- Better default experience

### Why vtsls instead of tsserver?

**vtsls** is:

- Significantly faster
- Better performance on large projects
- Active maintenance
- Drop-in replacement for tsserver

### Can I add more plugins?

Absolutely! See [Customization Guide](/customization#adding-plugins).

### How do I remove a plugin?

1. Delete or comment out the plugin file in `lua/plugins/`
2. Run `:Lazy clean`
3. Remove related keybindings

### Why no autopairs plugin?

There is one! **mini.pairs** provides auto-pairing. Toggle with `<leader>up`.

## Keybindings

### Why Space as leader?

Space is:

- Easy to reach with either thumb
- Works on all keyboards
- Doesn't conflict with Vim defaults
- Common in the Neovim community

### Can I change the leader key?

Yes, edit `lua/options.lua`:

```lua
vim.g.mapleader = ","  -- Or any key
```

See [Customization](/customization#changing-the-leader-key).

### How do I discover keybindings?

Press `<leader>` (Space) and wait - **which-key** shows all available bindings!

Also:
- `<leader>fk` - Search keymaps
- [Keybindings documentation](/keybindings)

### Why `grr` for references instead of `gr`?

`grr` is the Neovim 0.11+ native default. It's designed to:

- Avoid conflicts with other plugins
- Be consistent with other `gr*` mappings
- Follow Vim conventions

## LSP

### Why isn't my language supported?

This configuration focuses on web development (TypeScript/JavaScript, Lua). To add support:

1. Install LSP server via Mason
2. Create config file in `lsp/`
3. Add to server list in `lua/plugins/lsp-config.lua`

See [Adding LSP Servers](/customization#adding-a-new-lsp-server).

### Can I use Rust/Python/Go with this config?

Yes! Install the LSP server via Mason and configure it. The infrastructure is already there.

### Why are inlay hints disabled by default?

Inlay hints can be visually noisy. Toggle with `<leader>th` to try them out.

To enable by default, see [Configuration](/configuration#inlay-hints).

## Formatting

### Why isn't my file formatting?

Check:

1. Auto-format is enabled: `<leader>uf`
2. Formatter is installed: `:Mason`
3. File type is configured in `lua/plugins/conform.lua`
4. Project has formatter config (`.prettierrc`, etc.)

See [Troubleshooting](/troubleshooting#formatting-issues).

### Can I use different formatters?

Yes! Edit `lua/plugins/conform.lua`:

```lua
formatters_by_ft = {
  javascript = { "your_formatter" },
}
```

### How do I disable auto-format?

Toggle with `<leader>uf`.

Or permanently in `lua/plugins/conform.lua`:

```lua
format_on_save = false,
```

## Customization

### How do I change the color scheme?

Edit `lua/plugins/color-themes.lua`:

```lua
vim.cmd([[colorscheme your_theme]])
```

See [Customization](/customization#changing-the-color-scheme).

### Can I change the font?

The font is configured in your terminal, not Neovim. This config requires a **Nerd Font** for icons.

Recommended: **JetBrainsMono Nerd Font**

### How do I change tab size?

Edit `lua/options.lua`:

```lua
vim.opt.tabstop = 4      -- Your preferred size
vim.opt.shiftwidth = 4
```

### Can I use a GUI?

Yes! This config works with:

- **Neovide**
- **Goneovim**
- **VimR** (macOS)
- **nvim-qt**

Most features will work, though some terminal-specific settings may need adjustment.

## Performance

### Is Neovim faster than VS Code?

Yes, significantly:

- Faster startup (< 100ms vs seconds)
- Lower memory usage
- Instant file opening
- Better terminal performance

### Why is startup slow?

Check plugin load times:

```vim
:Lazy profile
```

Most likely causes:
- Too many plugins loading on startup
- Large plugin dependencies
- Slow LSP servers

See [Troubleshooting](/troubleshooting#performance-issues).

### How can I make it faster?

1. Lazy load plugins with `event`, `cmd`, `keys`
2. Disable unused plugins
3. Use faster alternatives (e.g., `fd` instead of `find`)
4. Reduce `updatetime` if needed

## Workflow

### How do I use this with tmux?

Works great with tmux! Consider:

- Setting `$TERM` to `tmux-256color`
- True color support in tmux
- Navigator plugin for seamless pane switching

### Can I use this over SSH?

Yes! Neovim works perfectly over SSH. This configuration is lightweight and terminal-based.

### How do I integrate with Git?

Git integration included:

- **Gitsigns**: Visual git decorations
- **Fugitive**: Git commands (`:Git status`, `:Git commit`)

Keybindings:
- `<leader>gs` - Git status
- `<leader>gc` - Git commit
- `<leader>gp` - Git push

### Does this work with monorepos?

Yes, the LSP servers support monorepos. You may need to configure workspace folders for optimal performance.

## Comparison

### How is this different from LazyVim?

| Feature | This Config | LazyVim |
|---------|-------------|---------|
| Complexity | Simple | More complex |
| Plugins | ~40 | 50+ |
| Customization | Very easy | Moderate |
| Updates | Manual | Structured |
| Learning curve | Gentle | Steeper |
| Opinionated | Focused | Comprehensive |

### Should I use this or build my own?

**Use this if:**
- You want a working config quickly
- You're learning Neovim
- You do web development
- You want good defaults

**Build your own if:**
- You want complete control
- You have very specific needs
- You enjoy the process
- You want to learn deeply

## Troubleshooting

### Something broke after updating

1. Try `:Lazy sync` to sync plugins
2. Check `:checkhealth` for issues
3. Review `:messages` for errors
4. Restore from backup if needed

### Where do I report bugs?

Check GitHub issues for this repository. Include:
- Neovim version
- Operating system
- Error messages
- Steps to reproduce

## Philosophy

### Why no statusline plugin?

Native statusline is:

- Instant performance
- Simple to customize
- One less dependency
- Easy to understand

But you can easily add lualine if preferred! See [Statusline](/statusline#using-a-statusline-plugin).

### Why these specific plugins?

Plugins were chosen for:

- **Quality**: Well-maintained and popular
- **Performance**: Fast and efficient
- **Integration**: Work well together
- **Modern**: Use latest Neovim features
- **Opinionated**: Best tool for the job

### What's the philosophy?

1. **Modern first**: Use latest Neovim features
2. **Minimal core**: Only essential plugins
3. **Performance**: Speed matters
4. **Learning**: Understand your tools
5. **Web dev focus**: Optimized for TypeScript/React
6. **Easy customization**: Simple to modify

## Getting Help

### Where can I learn more?

- `:help` in Neovim
- [Neovim documentation](https://neovim.io/doc/)
- [This documentation site](/getting-started)
- Plugin documentation on GitHub
- Neovim subreddit and Discord

### How do I learn Vim motions?

- `:Tutor` - Built-in tutorial
- `vimtutor` - Classic tutorial
- Practice in normal editing
- Focus on one motion at a time

---

Have more questions? Check the [Troubleshooting](/troubleshooting) guide or open an issue on GitHub!
