return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "vtsls" },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")

      local function on_attach(client, bufnr)
        if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          vim.lsp.inlay_hint.enable(true)
        end
      end

      lspconfig.vtsls.setup {
        on_attach = on_attach,
        settings = {
          typescript = {
            inlayHints = {
              -- parameterNames = { enabled = "all" },
              -- parameterTypes = { enabled = true },
              -- variableTypes = { enabled = true },
              -- propertyDeclarationTypes = { enabled = true },
              -- functionLikeReturnTypes = { enabled = true },
              -- enumMemberValues = { enabled = true },
            },
          },
          javascript = {
            inlayHints = {
              -- parameterNames = { enabled = "all" },
              -- parameterTypes = { enabled = true },
              -- variableTypes = { enabled = true },
              -- propertyDeclarationTypes = { enabled = true },
              -- functionLikeReturnTypes = { enabled = true },
              -- enumMemberValues = { enabled = true },
            },
          },
        },
      }
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
      -- {
      -- 	"<space>ca",
      -- 	function()
      -- 		vim.lsp.buf.code_action()
      -- 	end,
      -- 	desc = "Code action",
      -- },
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
  }
}

