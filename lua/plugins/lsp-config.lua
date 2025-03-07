-- vim.lsp.inlay_hint.enable()

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

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

      require("mason-lspconfig").setup_handlers({
        function(server_name)
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

        ["tsserver"] = function()
          local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
          local volar_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"

          require("lspconfig").tsserver.setup({
            -- NOTE: To enable Hybrid Mode, change hybrideMode to true above and uncomment the following filetypes block.
            -- WARN: THIS MAY CAUSE HIGHLIGHTING ISSUES WITHIN THE TEMPLATE SCOPE WHEN TSSERVER ATTACHES TO VUE FILES

            -- filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            init_options = {
              plugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = volar_path,
                  languages = { "vue" },
                },
              },
            },
            settings = {
              typescript = {
                inlayHints = {
                  includeInlayParameterNameHints = "all",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
            },
          })
        end,

        ["volar"] = function()
          require("lspconfig").volar.setup({
            -- NOTE: Uncomment to enable volar in file types other than vue.
            -- (Similar to Takeover Mode)

            -- filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact", "json" },

            -- NOTE: Uncomment to restrict Volar to only Vue/Nuxt projects. This will enable Volar to work alongside other language servers (tsserver).
            root_dir = require("lspconfig").util.root_pattern(
              "vue.config.js",
              "vue.config.ts",
              "nuxt.config.js",
              "nuxt.config.ts"
            ),
            init_options = {
              vue = {
                hybridMode = false,
              },
              -- NOTE: This might not be needed. Uncomment if you encounter issues.

              -- typescript = {
              --   tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
              -- },
            },
            settings = {
              typescript = {
                -- inlayHints = {
                --   enumMemberValues = {
                --     enabled = true,
                --   },
                --   functionLikeReturnTypes = {
                --     enabled = true,
                --   },
                --   propertyDeclarationTypes = {
                --     enabled = true,
                --   },
                --   parameterTypes = {
                --     enabled = true,
                --     suppressWhenArgumentMatchesName = true,
                --   },
                --   variableTypes = {
                --     enabled = true,
                --   },
                -- },
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
  },
}
