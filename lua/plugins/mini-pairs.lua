return {
  "echasnovski/mini.pairs",
  version = false,
  event = { "BufReadPost", "BufNewFile" },
  opts = {},
  init = function()
    -- Load saved auto-pairs state or enable by default
    local persist = require("persist")
    vim.g.minipairs_disable = persist.get("minipairs_disable", false)
  end,
  config = function(_, opts)
    require("mini.pairs").setup(opts)

    -- Toggle mini.pairs
    vim.keymap.set("n", "<leader>up", function()
      local persist = require("persist")
      vim.g.minipairs_disable = not vim.g.minipairs_disable
      persist.set("minipairs_disable", vim.g.minipairs_disable)
      local status = vim.g.minipairs_disable and "disabled" or "enabled"
      vim.notify("Auto-pairs " .. status, vim.log.levels.INFO)
    end, { desc = "Toggle auto-pairs" })
  end,
}
