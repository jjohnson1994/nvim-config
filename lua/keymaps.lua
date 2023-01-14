local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<space>w", ":w<cr>", opts)
vim.keymap.set("n", "<space>W", ":wa<cr>", opts)
vim.keymap.set("n", "<space>q", ":q<cr>", opts)
vim.keymap.set("n", "<space>Q", ":qa<cr>", opts)
