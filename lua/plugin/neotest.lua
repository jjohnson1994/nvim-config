require("neotest").setup({
  adapters = {
    require("neotest-jest")
  },
})

vim.keymap.set("n", "<space>ta", "<cmd>lua require('neotest').run.attach()<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<space>tf",  "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<space>tF",  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<space>tl",  "<cmd>lua require('neotest').run.run_last()<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<space>tL",  "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<space>tn",  "<cmd>lua require('neotest').run.run()<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<space>tN",  "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<space>to",  "<cmd>lua require('neotest').output.open({ enter = true })<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<space>tS",  "<cmd>lua require('neotest').run.stop()<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<space>ts",  "<cmd>lua require('neotest').summary.toggle()<cr>", {silent = true, noremap = true})
