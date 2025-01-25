return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    opts = {},
    config = function()
      require("vscode").setup()

      -- vim.cmd.colorscheme("vscode")
    end,
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("onedark").setup({
        style = "darker",
      })

      -- require("onedark").load()

      -- vim.cmd([[colorscheme onedark]])
    end,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.cmd([[colorscheme rose-pine]])
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    config = function()
      -- vim.cmd([[colorscheme github_dark_high_contrast]])
    end,
  },
}
