return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    win = {
      border = "rounded",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Register group names
    wk.add({
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Code" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Hunk" },
      { "<leader>l", group = "LSP" },
      { "<leader>n", group = "Notifications" },
      { "<leader>t", group = "Toggle/Test" },
      { "<leader>u", group = "UI" },
      { "<leader>x", group = "Trouble" },
      { "g", group = "Go to" },
      { "[", group = "Previous" },
      { "]", group = "Next" },
    })

    -- Register toggle keymaps with dynamic descriptions
    wk.add({
      {
        "<leader>uf",
        desc = function()
          local action = vim.g.autoformat and "disable" or "enable"
          return "Autoformat (" .. action .. ")"
        end,
      },
      {
        "<leader>ul",
        desc = function()
          local action = vim.g.autolint and "disable" or "enable"
          return "Auto-lint (" .. action .. ")"
        end,
      },
      {
        "<leader>up",
        desc = function()
          local enabled = not vim.g.minipairs_disable
          local action = enabled and "disable" or "enable"
          return "Auto-pairs (" .. action .. ")"
        end,
      },
      {
        "<leader>ud",
        desc = function()
          local current = vim.g.diagnostic_mode or "virtual_lines"
          local next_mode
          if current == "virtual_lines" then
            next_mode = "virtual text"
          elseif current == "virtual_text" then
            next_mode = "minimal"
          else
            next_mode = "virtual lines"
          end
          return "Diagnostics (" .. next_mode .. ")"
        end,
      },
      {
        "<leader>th",
        desc = function()
          local action = vim.g.inlay_hints_enabled and "disable" or "enable"
          return "Inlay hints (" .. action .. ")"
        end,
      },
      {
        "<leader>tb",
        desc = function()
          local action = vim.g.git_blame_enabled and "disable" or "enable"
          return "Git blame (" .. action .. ")"
        end,
      },
      {
        "<leader>uu",
        desc = function()
          local action = vim.g.auto_update_check and "disable" or "enable"
          return "Auto update check (" .. action .. ")"
        end,
      },
    })
  end,
}
