# Documentation

This directory contains the VitePress documentation for the Neovim configuration.

## Development

### Setup

Install dependencies:

```bash
cd docs
npm install
```

### Local Development

Start the development server:

```bash
npm run docs:dev
```

The site will be available at `http://localhost:5173`

### Build

Build the static site:

```bash
npm run docs:build
```

Preview the built site:

```bash
npm run docs:preview
```

## Structure

```
docs/
├── .vitepress/
│   └── config.mts         # VitePress configuration
├── index.md               # Home page
├── getting-started.md     # Installation guide
├── features.md            # Feature overview
├── configuration.md       # Configuration reference
├── customization.md       # Customization guide
├── keybindings.md         # Key bindings reference
├── plugins.md             # Plugin documentation
├── lsp-servers.md         # LSP server details
├── statusline.md          # Statusline documentation
├── troubleshooting.md     # Troubleshooting guide
├── faq.md                 # FAQ
└── package.json           # Dependencies
```

## Deployment

The documentation is automatically deployed to GitHub Pages when changes are pushed to the `main` branch.

### Initial GitHub Pages Setup

1. Go to your repository settings
2. Navigate to "Pages" section
3. Under "Build and deployment":
   - Source: GitHub Actions
4. Push changes to trigger deployment

### Manual Deployment

The GitHub Actions workflow (`.github/workflows/deploy-docs.yml`) handles deployment automatically.

To trigger manually:

1. Go to Actions tab in GitHub
2. Select "Deploy VitePress Docs"
3. Click "Run workflow"

## Configuration

### Update Base URL

Before deploying, update the base URL in `.vitepress/config.mts`:

```ts
export default defineConfig({
  base: "/your-repo-name/", // Change this to your repo name
  // ...
});
```

### Update GitHub Links

Update the GitHub repository URLs in:

- `.vitepress/config.mts` - Social links and edit links
- `index.md` - Hero action buttons

Replace `https://github.com/jjohnson1994/neojim` with your actual repository URL.

## Adding Content

### New Page

1. Create a new `.md` file in the `docs/` directory
2. Add it to the sidebar in `.vitepress/config.mts`:

```ts
sidebar: [
  {
    text: "Section",
    items: [{ text: "New Page", link: "/new-page" }],
  },
];
```

### Images

Place images in `docs/public/` and reference them:

```md
![Alt text](/image.png)
```

## Tips

- Use VitePress [markdown extensions](https://vitepress.dev/guide/markdown)
- Add custom components in `.vitepress/theme/`
- Test locally before pushing
- Keep URLs lowercase and hyphenated
