import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Neovim Configuration",
  description: "Modern Neovim configuration for web development",
  base: "/neojim/",

  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: "Home", link: "/" },
      { text: "Getting Started", link: "/getting-started" },
      { text: "Configuration", link: "/configuration" },
      { text: "Keybindings", link: "/keybindings" },
    ],

    sidebar: [
      {
        text: "Introduction",
        items: [
          { text: "Overview", link: "/" },
          { text: "Features", link: "/features" },
        ],
      },
      {
        text: "Guide",
        items: [
          { text: "Getting Started", link: "/getting-started" },
          { text: "Configuration", link: "/configuration" },
          { text: "Customization", link: "/customization" },
        ],
      },
      {
        text: "Reference",
        items: [
          { text: "Key Bindings", link: "/keybindings" },
          { text: "Plugins", link: "/plugins" },
          { text: "LSP Servers", link: "/lsp-servers" },
          { text: "Statusline", link: "/statusline" },
        ],
      },
      {
        text: "Help",
        items: [
          { text: "Troubleshooting", link: "/troubleshooting" },
          { text: "FAQ", link: "/faq" },
        ],
      },
    ],

    socialLinks: [
      { icon: "github", link: "https://github.com/jjohnson1994/neojim" },
    ],

    search: {
      provider: "local",
    },

    editLink: {
      pattern: "https://github.com/jjohnson1994/neojim/edit/main/docs/:path",
    },

    footer: {
      message: "Released under the MIT License.",
      copyright: "Copyright © 2025 James",
    },
  },

  markdown: {
    theme: {
      light: "github-light",
      dark: "github-dark",
    },
  },
});
