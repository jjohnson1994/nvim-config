# LSP Servers

Language Server Protocol (LSP) configuration and server details.

## Configured Servers

This configuration includes five LSP servers optimized for web development and documentation:

### TypeScript/JavaScript (vtsls)

**Fast TypeScript language server**

- Better performance than `tsserver`
- Full TypeScript and JavaScript support
- JSX/TSX support
- Inlay hints for types, parameters, and return values
- Code actions and refactoring

**Configuration file:** `lsp/vtsls.lua`

#### Features

- **Inlay Hints**: Shows inline type information
  - Parameter names
  - Parameter types
  - Variable types
  - Return types
  - Enum member values

- **Completion**: Intelligent code completion with import auto-completion

- **Diagnostics**: Real-time error checking

- **Code Actions**:
  - Add missing imports
  - Organize imports
  - Extract to function/constant
  - Implement interface

#### Settings

```lua
{
  typescript = {
    inlayHints = {
      parameterNames = { enabled = "all" },
      parameterTypes = { enabled = true },
      variableTypes = { enabled = true },
      propertyDeclarationTypes = { enabled = true },
      functionLikeReturnTypes = { enabled = true },
      enumMemberValues = { enabled = true },
    },
  },
}
```

#### Supported File Types

- `.js`, `.jsx` - JavaScript
- `.ts`, `.tsx` - TypeScript
- `.mjs`, `.cjs` - ES Modules
- `.vue` - Vue Single File Components
- `.svelte` - Svelte Components

### Lua (lua_ls)

**Lua language server with Neovim support**

- Neovim API awareness
- LuaJIT runtime
- Vim global recognition
- Type checking
- Diagnostics

**Configuration file:** `lsp/lua_ls.lua`

#### Features

- **Neovim Integration**: Understands `vim` global and Neovim APIs
- **Workspace Library**: Pre-configured with Neovim runtime
- **Diagnostics**: Lua-specific linting and type checking
- **Completion**: Context-aware Lua and Neovim API completion

#### Settings

```lua
{
  Lua = {
    runtime = {
      version = "LuaJIT",  -- Use LuaJIT (Neovim's Lua version)
    },
    diagnostics = {
      globals = { "vim" },  -- Recognize 'vim' global
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file("", true),  -- Neovim runtime
      checkThirdParty = false,
    },
    telemetry = {
      enable = false,
    },
  },
}
```

#### Supported File Types

- `.lua` - Lua files
- Neovim config files

### JSON (jsonls)

**JSON language server with schema validation**

- JSON and JSONC file support
- Schema validation for common config files
- Auto-completion based on schemas
- Powered by schemastore.nvim

**Configuration file:** `lsp/jsonls.lua`

#### Features

- **Schema Validation**: Validates JSON against schemas for:
  - `package.json` - npm package configuration
  - `tsconfig.json` - TypeScript configuration
  - `.eslintrc.json` - ESLint configuration
  - And hundreds more via schemastore

- **Auto-completion**: Schema-aware completion for:
  - Property names
  - Property values
  - Enum values
  - Documentation on hover

- **Diagnostics**: Real-time validation errors

#### Settings

```lua
{
  json = {
    schemas = require("schemastore").json.schemas(),
    validate = { enable = true },
  },
}
```

#### Supported File Types

- `.json` - JSON files
- `.jsonc` - JSON with comments

### Svelte

**Svelte framework support**

- Svelte component support
- TypeScript in Svelte
- CSS/SCSS support
- Diagnostics and completion

**Configuration file:** `lsp/svelte.lua`

#### Features

- **Component Intelligence**: Full Svelte syntax support
- **TypeScript Support**: Type checking in `<script lang="ts">`
- **Style Support**: CSS/SCSS in `<style>` blocks
- **Diagnostics**: Svelte-specific error checking

#### Supported File Types

- `.svelte` - Svelte components

### Markdown (marksman)

**Markdown language server for navigation and organization**

- Wiki-link support
- Reference finding
- Document symbols
- Code completion for links and references

**Configuration file:** `lsp/marksman.lua`

#### Features

- **Wiki-Links**: Navigate between markdown files using `[[wiki-links]]`
- **References**: Find all references to a heading or file
- **Document Symbols**: Browse document structure and headings
- **Completion**: Auto-complete file names in links
- **Hover**: Preview linked files and references
- **Diagnostics**: Detect broken links

#### Supported File Types

- `.md` - Markdown files
- `.markdown` - Markdown files
- `.mdx` - MDX files (Markdown with JSX)

## Common LSP Features

All configured LSP servers provide these features:

### Navigation

- **Go to definition** (`gd`)
- **Go to declaration** (`gD`)
- **Go to type definition** (`grt`)
- **Go to implementation** (`gri`)
- **Find references** (`grr`)

### Code Intelligence

- **Hover documentation** (`K`)
- **Signature help** (`<C-s>` in insert mode)
- **Document symbols** (`gO`)
- **Workspace symbols** (`<leader>fw`)

### Code Actions

- **Code actions** (`gra`)
- **Rename symbol** (`grn`)
- **Format document** (`<leader>cf`)

### Diagnostics

- **Real-time error checking**
- **Warning and hint messages**
- **Diagnostic signs in sign column**
- **Navigate diagnostics** (`[d`, `]d`)

## Installation

LSP servers are installed via Mason:

```vim
:Mason
```

Search for and install:
- `json-lsp` - JSON
- `lua_ls` - Lua
- `marksman` - Markdown
- `svelte` - Svelte (optional)
- `vtsls` - TypeScript/JavaScript

## Adding a New Server

See the [Customization Guide](/customization#adding-a-new-lsp-server) for instructions.

## Capabilities

LSP capabilities are provided by blink.cmp:

```lua
local capabilities = require("blink.cmp").get_lsp_capabilities()
```

This enables:
- Snippet support
- Completion support
- Signature help
- And more

## Inlay Hints

TypeScript inlay hints can be toggled with `<leader>th`.

To enable by default, add to `lua/options.lua`:

```lua
vim.lsp.inlay_hint.enable(true)
```

## Checking LSP Status

### Check if LSP is attached

```vim
:lua vim.print(vim.lsp.get_clients({ bufnr = 0 }))
```

This shows all LSP clients attached to the current buffer with their:
- Name
- ID
- Root directory
- Capabilities

### Check LSP health

```vim
:checkhealth vim.lsp
```

### View LSP logs

```vim
:lua vim.cmd('edit ' .. vim.lsp.get_log_path())
```

## Troubleshooting

### Server not starting

1. Check if server is installed:
   ```vim
   :Mason
   ```

2. Check LSP info:
   ```vim
   :lua vim.print(vim.lsp.get_clients({ bufnr = 0 }))
   ```

3. Check logs:
   ```vim
   :lua vim.cmd('edit ' .. vim.lsp.get_log_path())
   ```

### Completion not working

1. Verify blink.cmp is loaded:
   ```vim
   :lua print(vim.inspect(require("blink.cmp")))
   ```

2. Check LSP is attached:
   ```vim
   :lua vim.print(vim.lsp.get_clients({ bufnr = 0 }))
   ```

### Diagnostics not showing

Check diagnostic configuration:
```vim
:lua vim.print(vim.diagnostic.config())
```

## Server-Specific Notes

### vtsls

- Faster than traditional `tsserver`
- Requires Node.js and npm
- Works with monorepos
- Supports Vue and Svelte files

### lua_ls

- Requires configuring for Neovim
- Pre-configured with Neovim runtime
- Type checking can be strict - adjust in `lsp/lua_ls.lua` if needed

### svelte

- Requires TypeScript/JavaScript server for full functionality
- May need project-specific `svelte.config.js`

## Performance Tips

1. **Disable unused servers**: Comment out servers you don't need in `lua/plugins/lsp-config.lua`

2. **Large projects**: Some servers may be slow on large codebases. Consider workspace configuration.

3. **Monorepos**: Configure workspace folders for better performance

## Related

- [Configuration](/configuration)
- [Customization](/customization)
- [Keybindings](/keybindings#lsp-language-server-protocol)
