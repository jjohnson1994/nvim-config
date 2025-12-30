---
layout: home

hero:
  name: "Neovim Configuration"
  text: "Modern setup for web development"
  tagline: Optimized for React, TypeScript, and modern JavaScript with native LSP
  actions:
    - theme: brand
      text: Get Started
      link: /getting-started
    - theme: alt
      text: View on GitHub
      link: https://github.com/jjohnson1994/neojim
  image:
    src: /logo.svg
    alt: Neovim

features:
  - icon: 🚀
    title: Modern Architecture
    details: Built on Neovim 0.11+ with native LSP support and latest APIs
  - icon: ⚡
    title: Fast Performance
    details: Lazy loading with lazy.nvim plugin manager for instant startup
  - icon: 💻
    title: Web Development
    details: Optimized for React, TypeScript, Vue, and Svelte
  - icon: 🎨
    title: Beautiful Themes
    details: Multiple color schemes including GitHub, Tokyo Night, Catppuccin
  - icon: 🔍
    title: Smart Search
    details: FZF-lua for blazing fast fuzzy finding and navigation
  - icon: ✨
    title: Auto-completion
    details: blink.cmp with LuaSnip for intelligent code completion
  - icon: 🔧
    title: Full LSP Integration
    details: Complete TypeScript/JavaScript language server support
  - icon: 🔀
    title: Git Integration
    details: Gitsigns and Fugitive for seamless version control
---

## Quick Start

```bash
# Install prerequisites (macOS)
brew install ripgrep fd

# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this configuration
git clone https://github.com/jjohnson1994/neojim ~/.config/nvim

# Launch Neovim (plugins will auto-install)
nvim
```

## Built with Claude Code

99% of this configuration was built using [Claude Code](https://claude.com/claude-code)

## What's Inside

This configuration includes:

- **40+ plugins** carefully selected for web development
- **Native LSP** with TypeScript, JavaScript, Lua, and Svelte support
- **Smart formatting** with Prettier and ESLint integration
- **Git workflow** with visual diff, blame, and hunk operations
- **Testing support** with Neotest and Vitest
- **Custom statusline** with LSP diagnostics and git info

[Get Started →](/getting-started)
