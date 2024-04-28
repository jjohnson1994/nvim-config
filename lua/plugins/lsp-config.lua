return {
  {
    "williamboman/mason.nvim",
    lazy = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

          local lsp_formatting = function(bufnr)
            vim.lsp.buf.format({
              filter = function(client)
                -- apply whatever logic you want (in this example, we'll only use null-ls)
                return client.name ~= "tsserver" and client.name ~= "volar"
              end,
              bufnr = bufnr,
              timeout_ms = 2000,
            })
          end

          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
              if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                  group = augroup,
                  buffer = bufnr,
                  callback = function()
                    lsp_formatting(bufnr)
                  end,
                })
              end
            end,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                },
              },
            },
          })
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    keys = {
      {
        "K",
        function()
          vim.lsp.buf.hover()
        end,
        desc = "Hover",
      },
      {
        "<space>ca",
        function()
          vim.lsp.buf.code_action()
        end,
        desc = "Code action",
      },
      {
        "gK",
        function()
          vim.lsp.buf.signature_help()
        end,
        desc = "Signature help",
      },
      {
        "gd",
        function()
          vim.lsp.buf.definition()
        end,
        desc = "Definition",
      },
      {
        "gD",
        function()
          vim.lsp.buf.declaration()
        end,
        desc = "Declaration",
      },
      {
        "<space>rn",
        function()
          vim.lsp.buf.rename()
        end,
        desc = "Rename",
      },
    },
  },
}
