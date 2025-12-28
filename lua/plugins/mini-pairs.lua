return {
  "echasnovski/mini.pairs",
  version = false,
  event = "InsertEnter",
  opts = {},
  config = function(_, opts)
    require("mini.pairs").setup(opts)

    -- Toggle mini.pairs
    vim.keymap.set("n", "<leader>up", function()
      vim.g.minipairs_disable = not vim.g.minipairs_disable
      local status = vim.g.minipairs_disable and "disabled" or "enabled"
      vim.notify("Auto-pairs " .. status, vim.log.levels.INFO)
    end, { desc = "Toggle auto-pairs" })
  end,
}
