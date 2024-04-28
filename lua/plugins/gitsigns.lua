return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr

          vim.keymap.set(mode, l, r, opts)
        end

        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
      end,
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 200,
      },
    })
  end,
  keys = {
    {
      "]g",
      function()
        local gitsigns = require("gitsigns")

        if vim.wo.diff then
          vim.cmd.normal({ "]g", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end,
      desc = "Next hunk",
    },
    {
      "[g",
      function()
        local gitsigns = require("gitsigns")

        if vim.wo.diff then
          vim.cmd.normal({ "[g", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end,
      desc = "Previous hunk",
    },
  },
}
