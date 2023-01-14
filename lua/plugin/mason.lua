require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = {
    "html",
    "jsonls",
    "sumneko_lua",
    "tsserver",
    "vimls",
    "tailwindcss",
    "volar",
    "cssls",
    "emmet_ls",
    "yamlls",
    "terraformls",
    "dockerls",
    "eslint"
  }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- local lsp_formatting = function(bufnr)
--     vim.lsp.buf.format({
--         filter = function(client)
--             -- apply whatever logic you want (in this example, we'll only use null-ls)
--             return client.name == "null-ls"
--         end,
--         bufnr = bufnr,
--     })
-- end

mason_lspconfig.setup_handlers({
  function (server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, bufnr)
        end
        
        -- if client.supports_method("textDocument/formatting") then
        --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        --     vim.api.nvim_create_autocmd("BufWritePre", {
        --         group = augroup,
        --         buffer = bufnr,
        --         callback = function()
        --             lsp_formatting(bufnr)
        --         end,
        --     })
        -- end
      end
  }
  end
})

