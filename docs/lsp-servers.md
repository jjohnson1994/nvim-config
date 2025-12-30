# LSP Servers

Language Server Protocol (LSP) configuration and server details.

## Configured Servers

This configuration includes three LSP servers optimized for web development:

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
- `vtsls` - TypeScript/JavaScript
- `lua_ls` - Lua
- `svelte` - Svelte (optional)

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
:LspInfo
```

Shows:
- Attached servers
- Server capabilities
- Server status

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
   :LspInfo
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
   :LspInfo
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
