return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Enable auto-linting by default
    vim.g.autolint = true

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      vue = { "eslint_d" },
      svelte = { "eslint_d" },
    }

    -- Auto-lint on save and text changed
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        if vim.g.autolint then
          lint.try_lint()
        end
      end,
    })

    -- Manual lint command
    vim.keymap.set("n", "<leader>cl", function()
      lint.try_lint()
    end, { desc = "Trigger linting" })

    -- Toggle auto-linting
    vim.keymap.set("n", "<leader>ul", function()
      vim.g.autolint = not vim.g.autolint
      vim.notify("Auto-lint " .. (vim.g.autolint and "enabled" or "disabled"))
    end, { desc = "Toggle auto-lint" })
  end,
}
