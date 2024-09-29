return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr

          vim.keymap.set(mode, l, r, opts)
        end

        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        map({ "o", "x" }, "ah", ":<C-U>Gitsigns select_hunk<CR>")

        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.next_hunk()
          end
        end)

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.prev_hunk()
          end
        end)
      end,
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 200,
      },
    })
  end,
  -- keys = {
  --   {
  --     "]g",
  --     function()
  --       if vim.wo.diff then
  --         vim.cmd.normal({ "]g", bang = true })
  --       else
  --         require("gitsigns").nav_hunk("next")
  --       end
  --     end,
  --     desc = "Next hunk",
  --   },
  --   {
  --     "[g",
  --     function()
  --       if vim.wo.diff then
  --         vim.cmd.normal({ "[g", bang = true })
  --       else
  --         require("gitsigns").nav_hunk("prev")
  --       end
  --     end,
  --     desc = "Previous hunk",
  --   },
  -- },
}
