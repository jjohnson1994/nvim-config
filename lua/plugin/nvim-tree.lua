require("nvim-tree").setup({
  view = {
    adaptive_size = true,
    signcolumn = 'yes',
    number = true,
    relativenumber = true,
  },
  renderer = {
    icons = {
      git_placement = 'signcolumn'
    }
  },
  respect_buf_cwd = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  }
})

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
