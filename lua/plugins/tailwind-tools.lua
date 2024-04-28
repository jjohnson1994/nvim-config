return {
  "luckasRanarison/tailwind-tools.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {},
  config = function()
    require("tailwind-tools").setup({})
  end,
}
