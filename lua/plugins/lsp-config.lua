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
      "b0o/schemastore.nvim",
    },
    init = function()
      -- Load saved inlay hints state
      local persist = require("persist")
      vim.g.inlay_hints_enabled = persist.get("inlay_hints_enabled", false)
    end,
    config = function()
      -- Get blink.cmp capabilities
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- List of LSP servers to configure
      local servers = { "jsonls", "lua_ls", "marksman", "svelte", "vtsls" }

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
          -- Disable omnifunc (blink.cmp handles LSP completion directly)
          vim.bo[event.buf].omnifunc = ""

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

          -- Go to definition in splits/tabs
          map("n", "<leader>gv", function()
            vim.cmd.vsplit()
            vim.lsp.buf.definition()
          end, "Definition (vertical split)")
          map("n", "<leader>gh", function()
            vim.cmd.split()
            vim.lsp.buf.definition()
          end, "Definition (horizontal split)")
          map("n", "<leader>gt", function()
            vim.cmd("tab split")
            vim.lsp.buf.definition()
          end, "Definition (new tab)")

          -- Diagnostic keymaps
          map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
          map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
          map("n", "gl", vim.diagnostic.open_float, "Show diagnostic")
          map("n", "<leader>ld", vim.diagnostic.setloclist, "Diagnostic list")

          -- Apply saved inlay hints state and setup toggle
          if vim.lsp.inlay_hint then
            -- Apply saved state
            if vim.g.inlay_hints_enabled then
              vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
            end

            -- Toggle inlay hints
            map("n", "<leader>th", function()
              local persist = require("persist")
              local enabled = not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
              vim.lsp.inlay_hint.enable(enabled)
              vim.g.inlay_hints_enabled = enabled
              persist.set("inlay_hints_enabled", enabled)
            end, "Toggle inlay hints")
          end
        end,
      })
    end,
  },
}
