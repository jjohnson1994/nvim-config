return {
  "stevearc/conform.nvim",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "eslint_d", "prettierd" },
      javascriptreact = { "eslint_d", "prettierd" },
      typescript = { "eslint_d", "prettierd" },
      typescriptreact = { "eslint_d", "prettierd" },
      vue = { "eslint_d", "prettierd" },
      svelte = { "eslint_d", "prettierd" },
      css = { "prettierd" },
      scss = { "prettierd" },
      html = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
      graphql = { "prettierd" },
    },
    format_on_save = function(bufnr)
      -- Disable autoformat on certain filetypes or if disabled globally
      if not vim.g.autoformat then
        return
      end
      return {
        timeout_ms = 500,
        lsp_fallback = true,
      }
    end,
  },
  init = function()
    -- Enable autoformat by default
    vim.g.autoformat = true
  end,
  config = function(_, opts)
    require("conform").setup(opts)

    -- Manual format command
    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range" })

    -- Toggle autoformat
    vim.keymap.set("n", "<leader>uf", function()
      vim.g.autoformat = not vim.g.autoformat
      local status = vim.g.autoformat and "enabled" or "disabled"
      vim.notify("Autoformat " .. status, vim.log.levels.INFO)
    end, { desc = "Toggle autoformat" })
  end,
}
