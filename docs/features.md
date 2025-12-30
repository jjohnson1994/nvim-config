# Features

This Neovim configuration is packed with features designed for modern web development.

## Core Features

### 🚀 Modern Architecture

Built on Neovim 0.11+ with native LSP support, this configuration uses the latest Neovim APIs and features:

- Native LSP integration with built-in keybindings (`grr`, `gra`, `grn`)
- Native folding with LSP-based fold provider
- Modern diagnostic API with custom signs
- Latest treesitter integration

### ⚡ Fast Performance

Optimized for speed with lazy loading and efficient plugin management:

- **lazy.nvim** for intelligent plugin loading
- Plugins load only when needed
- Treesitter auto-disables for large files (>2000 lines)
- Minimal startup time

### 💻 Web Development Focus

Optimized for modern web development workflows:

- **TypeScript/JavaScript**: Full language server support with vtsls
- **React**: JSX/TSX syntax support and auto-tag closing
- **Vue**: Complete Vue 3 support with language server
- **Svelte**: Full Svelte integration
- **Tailwind CSS**: Intelligent completions and color previews
- **Auto-formatting**: ESLint and Prettier integration

## Plugin Highlights

### LSP & Completion

- **blink.cmp**: Lightning-fast native completion engine
- **LuaSnip**: Powerful snippet engine with friendly-snippets
- **Mason**: Easy installation of LSP servers, formatters, and linters

### Syntax & Parsing

- **Treesitter**: Advanced syntax highlighting and code understanding
- **Context-aware commenting**: Smart comments based on cursor position
- **Auto-tag closing**: Automatic HTML/JSX tag completion
- **TypeScript error translation**: Plain English TypeScript errors

### Formatting & Linting

- **conform.nvim**: Async formatting with multiple formatters
- **nvim-lint**: Async linting with ESLint support
- **Auto-format on save**: Toggle-able with `<leader>uf`

### Git Integration

- **Gitsigns**: Visual git decorations in sign column
- **Vim Fugitive**: Comprehensive git commands
- **Git hunks**: Stage, reset, and preview changes inline
- **Git blame**: View commit info for current line

### File Navigation

- **FZF-lua**: Blazing fast fuzzy finder
- **nvim-tree**: File explorer with git integration
- **Flash**: Navigate with search labels and enhanced motions
- **Vim Illuminate**: Highlight references to word under cursor

### Editing Enhancements

- **nvim-surround**: Add/change/delete surrounding pairs
- **mini.ai**: Extended text objects with treesitter
- **mini.pairs**: Smart auto-pairing
- **mini.bracketed**: Navigate with `[` and `]`
- **mini.indentscope**: Visualize indent scope

### UI & Visual

- **Snacks**: Notifications, smooth scrolling, dashboard
- **which-key**: Discover keybindings as you type
- **Trouble**: Beautiful diagnostics and quickfix UI
- **Custom statusline**: LSP diagnostics and git info
- **Marks**: Visual mark indicators in sign column

### Testing

- **Neotest**: Interactive testing framework
- **Vitest adapter**: Run and debug Vitest tests
- **Test UI**: Visual test results and output

### Color Schemes

Choose from 7 carefully selected themes:

- **GitHub** (default: dark_dimmed) - 10+ variants
- **Tokyo Night** - Clean dark theme
- **Catppuccin** - Soothing pastel theme
- **Rose Pine** - Natural pine theme
- **Kanagawa** - Inspired by Japanese art
- **Monokai Pro** - Classic with variants
- **One Dark** - Atom-inspired theme

## Philosophy

This configuration follows these principles:

1. **Minimal Core**: Close to stock Neovim with essential enhancements
2. **Modern APIs**: Always use latest Neovim features
3. **Lazy Loading**: Load plugins only when needed
4. **Web Development First**: Optimized for TypeScript/React workflows
5. **Batteries Included**: Works great out of the box
6. **Easy Customization**: Clean structure for modifications

## What Makes This Different

- **Neovim 0.11+ Native Features**: Uses latest LSP and diagnostic APIs
- **No Legacy Code**: Modern APIs only, no deprecated patterns
- **Opinionated but Flexible**: Sensible defaults with easy customization
- **Documentation First**: Well-documented with inline comments
- **Claude-Built**: 99% built with AI assistance, showcasing modern development

[Get Started →](/getting-started)
