# Troubleshooting

Common issues and solutions for this Neovim configuration.

## Installation Issues

### Plugins Not Installing

**Symptoms**: lazy.nvim doesn't auto-install plugins on first launch

**Solutions**:

1. Manually trigger installation:
   ```vim
   :Lazy sync
   ```

2. Check for errors:
   ```vim
   :Lazy log
   ```

3. Clean and reinstall:
   ```vim
   :Lazy clean
   :Lazy sync
   ```

4. Check internet connection and firewall settings

### Mason Packages Won't Install

**Symptoms**: LSP servers or formatters fail to install via Mason

**Solutions**:

1. Check Mason log:
   ```vim
   :Mason
   :MasonLog
   ```

2. Verify prerequisites:
   - Node.js and npm installed
   - Git installed
   - Internet connection working

3. Try manual installation:
   ```vim
   :Mason
   # Press 'i' on the package
   ```

4. Check platform compatibility - some packages don't work on all OS

## LSP Issues

### LSP Not Attaching

**Symptoms**: No LSP features (completion, diagnostics, etc.)

**Solutions**:

1. Check if LSP is running:
   ```vim
   :lua vim.print(vim.lsp.get_clients({ bufnr = 0 }))
   ```

2. Verify server is installed:
   ```vim
   :Mason
   ```

3. Check server is configured:
   - Look in `lua/plugins/lsp-config.lua` for server name
   - Check `lsp/<server>.lua` file exists

4. View LSP logs:
   ```vim
   :lua vim.cmd('edit ' .. vim.lsp.get_log_path())
   ```

5. Restart LSP:
   ```vim
   :lua vim.lsp.stop_client(vim.lsp.get_clients())
   ```
   Then reopen the file or run `:e`

### Diagnostics Not Showing

**Symptoms**: No error/warning signs in sign column

**Solutions**:

1. Check diagnostic configuration:
   ```vim
   :lua vim.print(vim.diagnostic.config())
   ```

2. Verify LSP is attached:
   ```vim
   :lua vim.print(vim.lsp.get_clients({ bufnr = 0 }))
   ```

3. Check if signs are disabled:
   ```vim
   :lua vim.print(vim.diagnostic.config().signs)
   ```

4. Manually trigger diagnostics:
   ```vim
   :lua vim.diagnostic.show()
   ```

### Inlay Hints Not Working

**Symptoms**: TypeScript type hints don't appear inline

**Solutions**:

1. Check if enabled:
   ```vim
   :lua vim.print(vim.lsp.inlay_hint.is_enabled(0))
   ```

2. Enable manually:
   ```vim
   :lua vim.lsp.inlay_hint.enable(true)
   ```

3. Toggle with keymap:
   ```
   <leader>th
   ```

4. Verify server supports inlay hints:
   ```vim
   :lua vim.print(vim.lsp.get_clients({ bufnr = 0 }))
   ```
   Look for `inlayHintProvider` capability

## Completion Issues

### Completion Not Appearing

**Symptoms**: No completion popup when typing

**Solutions**:

1. Verify blink.cmp is loaded:
   ```vim
   :lua print(vim.inspect(require("blink.cmp")))
   ```

2. Check LSP is attached:
   ```vim
   :lua vim.print(vim.lsp.get_clients({ bufnr = 0 }))
   ```

3. Manually trigger completion:
   ```
   <C-space>
   ```

4. Check for errors:
   ```vim
   :messages
   ```

### Snippets Not Working

**Symptoms**: Tab doesn't expand snippets

**Solutions**:

1. Verify LuaSnip is loaded:
   ```vim
   :lua print(vim.inspect(require("luasnip").available()))
   ```

2. Check snippet configuration in `lua/plugins/blink.lua`

3. Try manual snippet expansion:
   ```
   <Tab>
   ```

## Formatting Issues

### Auto-format Not Working

**Symptoms**: Files don't format on save

**Solutions**:

1. Check if auto-format is enabled:
   ```vim
   :lua print(vim.g.autoformat)
   ```

2. Enable auto-format:
   ```
   <leader>uf
   ```

3. Verify formatter is installed:
   ```vim
   :Mason
   ```

4. Check formatter configuration:
   - Look in `lua/plugins/conform.lua`
   - Verify your file type is listed

5. Manual format to see errors:
   ```
   <leader>cf
   ```

### Wrong Formatter Being Used

**Symptoms**: File formatted incorrectly or with wrong style

**Solutions**:

1. Check which formatters are configured:
   ```vim
   :ConformInfo
   ```

2. Verify formatter order in `lua/plugins/conform.lua`:
   ```lua
   javascript = { "eslint_d", "prettierd" }  -- Runs in order
   ```

3. Check project has formatter config (`.prettierrc`, `.eslintrc.js`)

## Git Integration Issues

### Gitsigns Not Showing

**Symptoms**: No git signs in sign column

**Solutions**:

1. Verify you're in a git repository:
   ```bash
   git status
   ```

2. Toggle gitsigns:
   ```vim
   :Gitsigns toggle_signs
   ```

3. Check gitsigns status:
   ```vim
   :Gitsigns toggle_current_line_blame
   ```

4. Restart gitsigns:
   ```vim
   :Gitsigns refresh
   ```

### Fugitive Commands Not Working

**Symptoms**: `:Git` commands fail

**Solutions**:

1. Verify git is installed:
   ```bash
   git --version
   ```

2. Check you're in a git repository

3. Try basic git command:
   ```vim
   :Git status
   ```

4. Check for error messages:
   ```vim
   :messages
   ```

## Performance Issues

### Slow Startup

**Symptoms**: Neovim takes a long time to start

**Solutions**:

1. Profile startup:
   ```vim
   :Lazy profile
   ```

2. Check which plugins are slow to load

3. Ensure lazy loading is configured:
   - Check `event`, `cmd`, `keys` in plugin configs

4. Disable unused plugins:
   - Comment out in `lua/plugins/`

### Slow Editing

**Symptoms**: Typing or navigating feels laggy

**Solutions**:

1. Check if treesitter is causing issues:
   ```vim
   :TSDisable highlight
   ```

2. Disable LSP temporarily:
   ```vim
   :LspStop
   ```

3. Check for large files:
   - Treesitter auto-disables for files >2000 lines
   - Consider manual disable

4. Reduce updatetime:
   ```lua
   vim.opt.updatetime = 500  -- Increase from 300
   ```

### High CPU Usage

**Symptoms**: Neovim using lots of CPU

**Solutions**:

1. Check running LSP servers:
   ```vim
   :lua vim.print(vim.lsp.get_clients({ bufnr = 0 }))
   ```

2. Stop unnecessary servers:
   ```vim
   :LspStop <server_name>
   ```

3. Check treesitter:
   ```vim
   :TSDisable highlight
   ```

4. Profile with:
   ```bash
   nvim --startuptime startup.log
   ```

## UI Issues

### Icons Not Showing

**Symptoms**: Boxes or question marks instead of icons

**Solutions**:

1. Install a Nerd Font:
   ```bash
   brew install --cask font-jetbrains-mono-nerd-font
   ```

2. Configure terminal to use Nerd Font

3. Restart terminal

### Colors Look Wrong

**Symptoms**: Colors are incorrect or washed out

**Solutions**:

1. Enable true color support in terminal

2. Check terminal supports 24-bit color:
   ```bash
   echo $COLORTERM
   # Should output: truecolor or 24bit
   ```

3. Force true color in Neovim:
   ```lua
   vim.opt.termguicolors = true
   ```

4. Try different theme:
   - Edit `lua/plugins/color-themes.lua`

### Statusline Not Updating

**Symptoms**: Diagnostics or file info not updating

**Solutions**:

1. Check updatetime:
   ```vim
   :set updatetime?
   ```

2. Reduce updatetime:
   ```lua
   vim.opt.updatetime = 250
   ```

3. Manually refresh:
   ```vim
   :redrawstatus
   ```

## Plugin-Specific Issues

### FZF-lua Not Finding Files

**Symptoms**: `:FzfLua files` shows no results

**Solutions**:

1. Verify `fd` is installed:
   ```bash
   fd --version
   ```

2. Install `fd`:
   ```bash
   brew install fd
   ```

3. Check you're in the right directory

4. Try with ripgrep:
   ```vim
   :FzfLua live_grep
   ```

### nvim-tree Not Opening

**Symptoms**: `<leader>e` doesn't work

**Solutions**:

1. Check nvim-tree is loaded:
   ```vim
   :lua print(vim.inspect(require("nvim-tree")))
   ```

2. Try command directly:
   ```vim
   :NvimTreeToggle
   ```

3. Check for errors:
   ```vim
   :messages
   ```

### Trouble Not Showing Diagnostics

**Symptoms**: `:Trouble` shows empty list

**Solutions**:

1. Verify there are diagnostics:
   ```vim
   :lua vim.print(vim.diagnostic.count(0))
   ```

2. Try different mode:
   ```vim
   :Trouble diagnostics
   ```

3. Restart Trouble:
   ```vim
   :Trouble diagnostics toggle
   ```

## Testing Issues

### Neotest Tests Not Running

**Symptoms**: `<leader>tt` doesn't run tests

**Solutions**:

1. Verify test file is recognized

2. Check adapter is configured:
   - Look in `lua/plugins/neotest.lua`

3. Try summary:
   ```
   <leader>ts
   ```

4. Check neotest output:
   ```
   <leader>to
   ```

## Checking for Errors

### View All Messages

```vim
:messages
```

### Check Health

```vim
:checkhealth
:checkhealth lazy
:checkhealth vim.lsp
:checkhealth nvim-treesitter
```

### View Logs

**Lazy.nvim log:**
```vim
:Lazy log
```

**LSP log:**
```vim
:lua vim.cmd('edit ' .. vim.lsp.get_log_path())
```

**Mason log:**
```vim
:MasonLog
```

## Getting Help

If you're still having issues:

1. Check the [FAQ](/faq)
2. Search GitHub issues
3. Check plugin documentation
4. `:help <topic>` in Neovim

## Reporting Issues

When reporting issues, include:

1. Neovim version (`:version`)
2. Operating system
3. Steps to reproduce
4. Error messages (`:messages`)
5. LSP info (`:LspInfo`)
6. Health check output (`:checkhealth`)
