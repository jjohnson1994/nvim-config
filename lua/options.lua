local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<space>w", ":w<CR>")
map("n", "<space>q", ":q<CR>")
map("n", "<space>x", ":x<CR>")

-- Window movement
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")

-- buffers
map("n", "<space>bd", "::b#|bd#<CR>")
map("n", "<space>bb", ":e #<CR>")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = "\\"
vim.opt.relativenumber = true
vim.opt.compatible = false
vim.opt.syntax = "enable"
vim.opt.autoread = true
vim.opt.autoindent = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.cmdheight = 1
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"
vim.opt.foldmethod = "syntax"
vim.opt.foldenable = false
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.modifiable = true
vim.opt.mouse = "a"
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.wb = false
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.showmatch = true
vim.opt.signcolumn = "yes"
vim.opt.so = 7
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.updatetime = 300
vim.opt.wildmenu = true
vim.opt.pumblend = 10
vim.opt.pumheight = 10
