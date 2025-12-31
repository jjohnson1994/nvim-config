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
  - icon: 📘
    title: Zero Learning Curve
    details: All default Neovim keybindings preserved. If you know vim, you're ready to go.
  - icon: 🎯
    title: Non-Conflicting
    details: Custom keybindings only use leader prefix. Default behaviors never overridden.
  - icon: 🌱
    title: Gradual Enhancement
    details: Discover features at your pace. Nothing forced, everything optional.
  - icon: 🪶
    title: Lightweight Foundation
    details: Minimal starting point for your customizations, not a complete IDE.
  - icon: 🔧
    title: Openly Extensible
    details: Easy to customize, extend, and make your own. No complex abstractions.
  - icon: 🚀
    title: Modern Architecture
    details: Built on Neovim 0.11+ with native LSP support and latest APIs
  - icon: ⚡
    title: Fast Performance
    details: Lazy loading with lazy.nvim plugin manager for instant startup
  - icon: 💻
    title: Web Development
    details: Optimized for React, TypeScript, Vue, and Svelte
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

## Philosophy

NeoJim is built on the principle that **great tools should enhance, not replace, your existing skills**.

If you already know vim, you can start using this configuration immediately without learning a single new keybinding. All default Neovim behaviors are preserved. Custom enhancements are available through the `<leader>` key (default: space), allowing you to discover and adopt new features at your own pace.

This isn't a complete IDE or opinionated framework—it's a lightweight, carefully curated foundation that respects Neovim's defaults while providing modern tooling for web development. Use what you need, ignore what you don't, and customize everything to fit your workflow.

**Core Principles:**
- ✅ Zero learning curve for vim users
- ✅ No conflicts with default Neovim behaviors
- ✅ Gradual, optional feature adoption
- ✅ Lightweight and extensible foundation

## What's Inside

This configuration includes:

- **40+ plugins** carefully selected for web development
- **Native LSP** with TypeScript, JavaScript, Lua, and Svelte support
- **Smart formatting** with Prettier and ESLint integration
- **Git workflow** with visual diff, blame, and hunk operations
- **Testing support** with Neotest and Vitest
- **Custom statusline** with LSP diagnostics and git info

[Get Started →](/getting-started)
