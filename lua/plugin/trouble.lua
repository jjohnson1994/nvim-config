require("trouble").setup { }

vim.keymap.set("n", "<space>tt", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<space>tD", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<space>td", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<space>tl", "<cmd>TroubleToggle loclist<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<space>tq", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true})

