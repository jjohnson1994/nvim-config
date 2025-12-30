# Key Bindings

Complete reference of all keybindings in this configuration.

::: tip Discovering Keybindings
Press `<leader>` (Space) and wait to see available keybindings with which-key, or press `<leader>fk` (Space + f + k) to search keybindings with fuzzy finder!
:::

## Leader Key

- **Leader**: `Space`
- **Local Leader**: `Space`

## General

| Key         | Mode | Action         |
| ----------- | ---- | -------------- |
| `<leader>w` | n    | Save file      |
| `<leader>W` | n    | Save all files |
| `<leader>q` | n    | Quit           |
| `<leader>Q` | n    | Quit all       |
| `<leader>a` | n    | Select all     |

## Window Navigation

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

## Buffer Management

| Key          | Mode | Action          |
| ------------ | ---- | --------------- |
| `<leader>bd` | n    | Delete buffer   |
| `<leader>bn` | n    | Next buffer     |
| `<leader>bp` | n    | Previous buffer |

## Editing

| Key         | Mode | Action                         |
| ----------- | ---- | ------------------------------ |
| `<`         | v    | Indent left (keeps selection)  |
| `>`         | v    | Indent right (keeps selection) |
| `J`         | v    | Move text down                 |
| `K`         | v    | Move text up                   |
| `<leader>p` | x    | Paste without yanking          |
| `<leader>d` | n/v  | Delete without yanking         |
| `<leader>y` | n/v  | Yank to system clipboard       |

## LSP (Language Server Protocol)

### Neovim 0.11+ Default Keybindings

These are native Neovim keybindings enabled by default in 0.11+:

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

### Additional LSP Keybindings

| Key          | Mode | Action             |
| ------------ | ---- | ------------------ |
| `gd`         | n    | Go to definition   |
| `gD`         | n    | Go to declaration  |
| `<leader>th` | n    | Toggle inlay hints |

## Diagnostics

| Key          | Mode | Action                |
| ------------ | ---- | --------------------- |
| `[d`         | n    | Previous diagnostic   |
| `]d`         | n    | Next diagnostic       |
| `gl`         | n    | Show diagnostic float |
| `<leader>ld` | n    | Diagnostic list       |

## Fuzzy Finding (FZF-lua)

### File & Search Operations

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

### LSP Operations

| Key          | Mode | Action                |
| ------------ | ---- | --------------------- |
| `<leader>fr` | n    | LSP references        |
| `<leader>fs` | n    | Document symbols      |
| `<leader>fw` | n    | Workspace symbols     |
| `<leader>fd` | n    | Document diagnostics  |
| `<leader>fD` | n    | Workspace diagnostics |

### Git Operations

| Key          | Mode | Action             |
| ------------ | ---- | ------------------ |
| `<leader>fm` | n    | Git modified files |

### Within FZF Window

| Key     | Action                       |
| ------- | ---------------------------- |
| `Tab`   | Mark/unmark item             |
| `Alt-a` | Select all                   |
| `Alt-d` | Deselect all                 |
| `Enter` | Accept (open selected items) |

## File Explorer (nvim-tree)

| Key         | Mode | Action               |
| ----------- | ---- | -------------------- |
| `<leader>e` | n    | Open at current file |
| `<leader>E` | n    | Toggle explorer      |

### Within nvim-tree Window

| Key      | Action                 |
| -------- | ---------------------- |
| `a`      | Create file/directory  |
| `d`      | Delete file/directory  |
| `r`      | Rename file/directory  |
| `x`      | Cut file/directory     |
| `c`      | Copy file/directory    |
| `p`      | Paste file/directory   |
| `y`      | Copy name to clipboard |
| `Y`      | Copy relative path     |
| `gy`     | Copy absolute path     |
| `<C-v>`  | Open in vertical split |
| `<C-x>`  | Open in horizontal split |
| `<Tab>`  | Open file preview      |
| `I`      | Toggle hidden files    |
| `R`      | Refresh tree           |

## Git (Gitsigns)

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

## Git (Fugitive)

| Key          | Mode | Action     |
| ------------ | ---- | ---------- |
| `<leader>gs` | n    | Git status |
| `<leader>gc` | n    | Git commit |
| `<leader>gp` | n    | Git push   |
| `<leader>gl` | n    | Git pull   |

## Formatting & Linting

| Key          | Mode | Action               |
| ------------ | ---- | -------------------- |
| `<leader>cf` | n/v  | Format file or range |
| `<leader>cl` | n    | Trigger linting      |

## Diagnostics UI (Trouble)

| Key          | Mode | Action                    |
| ------------ | ---- | ------------------------- |
| `<leader>xx` | n    | Toggle diagnostics        |
| `<leader>xX` | n    | Toggle buffer diagnostics |
| `<leader>xl` | n    | Location list             |
| `<leader>xq` | n    | Quickfix list             |
| `<leader>xs` | n    | Symbols                   |
| `<leader>xL` | n    | LSP references            |

## Testing (Neotest)

| Key          | Mode | Action              |
| ------------ | ---- | ------------------- |
| `<leader>tt` | n    | Run nearest test    |
| `<leader>tf` | n    | Run test file       |
| `<leader>ts` | n    | Toggle test summary |
| `<leader>to` | n    | Show test output    |

## Completion & Snippets

Powered by blink.cmp with LuaSnip integration. Features ghost text preview, auto-show documentation, and intelligent fuzzy matching.

### Completion

| Key                | Mode | Action                       |
| ------------------ | ---- | ---------------------------- |
| `<C-space>`        | i    | Show completion              |
| `<C-y>`            | i    | Accept completion            |
| `<C-e>`            | i    | Cancel completion            |
| `<C-n>` / `<Down>` | i    | Next completion              |
| `<C-p>` / `<Up>`   | i    | Previous completion          |
| `<C-b>` / `<C-f>`  | i    | Scroll documentation up/down |

### Snippets

| Key       | Mode | Action                       |
| --------- | ---- | ---------------------------- |
| `<Tab>`   | i/s  | Jump to next placeholder     |
| `<S-Tab>` | i/s  | Jump to previous placeholder |
| `<C-l>`   | i/s  | Change choice in snippet     |

### Completion Sources

Default sources (automatically configured by blink.cmp):

1. **LSP** - Language server completions (methods, functions, variables)
2. **Snippets** - LuaSnip snippets from friendly-snippets
3. **Path** - File path completions
4. **Buffer** - Words from current and other buffers

## Navigation (vim-illuminate)

| Key  | Mode | Action             |
| ---- | ---- | ------------------ |
| `]]` | n    | Next reference     |
| `[[` | n    | Previous reference |

## Navigation (Flash)

| Key          | Mode  | Action            |
| ------------ | ----- | ----------------- |
| `<leader>fj` | n/x/o | Flash jump        |
| `<leader>fJ` | n/x/o | Flash treesitter  |
| `<leader>fr` | o     | Remote flash      |
| `<leader>fR` | o/x   | Treesitter search |
| `<c-s>`      | c     | Toggle flash in search |

### How Flash Works

**Flash Jump** (`<leader>fj`):
1. Press `<leader>fj`
2. Start typing your search
3. Labels appear on matches
4. Press the label key to jump

**Flash Treesitter** (`<leader>fJ`):
Shows labels on syntax nodes (functions, classes, etc.)

## Surround Operations (nvim-surround)

### Add Surroundings

| Command | Action                        |
| ------- | ----------------------------- |
| `ysiw"` | Surround word with quotes     |
| `yss)`  | Surround line with parens     |
| `ySS{`  | Surround line with braces (indented) |

### Change Surroundings

| Command | Action                        |
| ------- | ----------------------------- |
| `cs"'`  | Change `"` to `'`             |
| `cs'<q>` | Change `'` to `<q></q>`      |
| `cs)]`  | Change `()` to `[]`           |

### Delete Surroundings

| Command | Action                        |
| ------- | ----------------------------- |
| `ds"`   | Delete surrounding quotes     |
| `dst`   | Delete surrounding HTML tags  |
| `ds)`   | Delete surrounding parens     |

### Visual Mode

| Command | Action                        |
| ------- | ----------------------------- |
| `S"`    | Surround selection with `"`   |
| `S<div>` | Surround with `<div></div>`  |

## Snacks

| Key          | Mode | Action                        |
| ------------ | ---- | ----------------------------- |
| `<leader>un` | n    | Dismiss all notifications     |
| `<leader>nh` | n    | Notification history          |
| `<c-/>`      | n/t  | Toggle terminal               |
| `<c-_>`      | n/t  | Toggle terminal (alternative) |

### Terminal Mode

When in terminal mode (`<c-/>`):

| Key         | Action                 |
| ----------- | ---------------------- |
| `<C-/>`     | Hide terminal          |
| `<C-h/j/k/l>` | Navigate to window   |

## UI Toggles

| Key          | Mode | Action             |
| ------------ | ---- | ------------------ |
| `<leader>uf` | n    | Toggle autoformat  |
| `<leader>up` | n    | Toggle auto-pairs  |
| `<leader>th` | n    | Toggle inlay hints |
| `<leader>tb` | n    | Toggle git blame   |

## Text Objects (mini.ai)

Enhanced text objects with treesitter support:

### Around/Inside

| Object | Description       |
| ------ | ----------------- |
| `a/i"` | Quotes            |
| `a/i'` | Single quotes     |
| `a/i`` | Backticks         |
| `a/i(` | Parentheses       |
| `a/i[` | Brackets          |
| `a/i{` | Braces            |
| `a/i<` | Angle brackets    |
| `a/it` | HTML/XML tags     |
| `a/if` | Function call     |
| `a/ia` | Function argument |

### Examples

- `dif` - Delete inside function
- `caa` - Change around argument
- `vit` - Select inside tag

## Bracketed Navigation (mini.bracketed)

Navigate with `[` and `]`:

| Key  | Action                |
| ---- | --------------------- |
| `[b` | Previous buffer       |
| `]b` | Next buffer           |
| `[c` | Previous git hunk     |
| `]c` | Next git hunk         |
| `[d` | Previous diagnostic   |
| `]d` | Next diagnostic       |
| `[f` | Previous file         |
| `]f` | Next file             |
| `[q` | Previous quickfix     |
| `]q` | Next quickfix         |
| `[t` | Previous treesitter node |
| `]t` | Next treesitter node  |

## Customizing Keybindings

To add your own keybindings, see the [Customization Guide](/customization#adding-keybindings).

## Cheat Sheet

Common workflows:

### Opening Files
1. `<leader>e` - Open file explorer
2. `<leader>ff` - Fuzzy find files
3. `<leader>fo` - Recent files

### Code Navigation
1. `gd` - Go to definition
2. `grr` - Find references
3. `<leader>fs` - Symbol search

### Git Workflow
1. `<leader>gs` - Git status
2. `<leader>hs` - Stage hunk
3. `<leader>gc` - Commit
4. `<leader>gp` - Push

### Editing
1. `<leader>cf` - Format file
2. `gra` - Code action
3. `grn` - Rename symbol

---

::: tip
Use `<leader>fk` to search all keymaps!
:::
