-- LSP Configuration using Neovim 0.11+ native vim.lsp.config API
-- No nvim-lspconfig or mason-lspconfig needed!

return {
  -- Mason for installing LSP servers, formatters, linters
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- Configure LSP servers using Neovim 0.11+ native API
  {
    dir = vim.fn.stdpath("config"),
    name = "lsp-config",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "saghen/blink.cmp",
      "williamboman/mason.nvim",
    },
    config = function()
      -- Get blink.cmp capabilities
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- List of LSP servers to configure
      local servers = { "lua_ls", "vtsls", "svelte" }

      -- Configure each server using vim.lsp.config
      for _, server_name in ipairs(servers) do
        local config_path = vim.fn.stdpath("config") .. "/lsp/" .. server_name .. ".lua"

        -- Load custom config if it exists
        local ok, server_config = pcall(dofile, config_path)
        local config = ok and type(server_config) == "table" and server_config or {}

        -- Add capabilities
        config.capabilities = capabilities

        -- Configure the server using Neovim 0.11+ native API
        vim.lsp.config(server_name, config)

        -- Enable the server (auto-activates for configured filetypes)
        vim.lsp.enable(server_name)
      end

      -- LSP keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(modes, keys, func, desc)
            vim.keymap.set(modes, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          -- Neovim 0.11+ default LSP keymaps
          -- Note: K, grr, gra, grn, gri, grt, gO are provided by default
          -- We're keeping them here for explicitness and custom descriptions

          map("n", "grr", vim.lsp.buf.references, "References")
          map({ "n", "v" }, "gra", vim.lsp.buf.code_action, "Code action")
          map("n", "grn", vim.lsp.buf.rename, "Rename")
          map("n", "gri", vim.lsp.buf.implementation, "Implementation")
          map("n", "grt", vim.lsp.buf.type_definition, "Type definition")
          map("n", "gO", vim.lsp.buf.document_symbol, "Document symbols")
          map("n", "K", vim.lsp.buf.hover, "Hover documentation")
          map("i", "<C-s>", vim.lsp.buf.signature_help, "Signature help")

          -- Additional useful keymaps (not provided by default)
          map("n", "gd", vim.lsp.buf.definition, "Go to definition")
          map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")

          -- Diagnostic keymaps
          map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
          map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
          map("n", "gl", vim.diagnostic.open_float, "Show diagnostic")
          map("n", "<leader>ld", vim.diagnostic.setloclist, "Diagnostic list")

          -- Toggle inlay hints
          if vim.lsp.inlay_hint then
            map("n", "<leader>th", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, "Toggle inlay hints")
          end
        end,
      })
    end,
  },
}
