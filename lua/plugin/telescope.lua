require('telescope').setup {
}
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')

vim.keymap.set("n", "<Leader>s", builtin.live_grep, { noremap = true, silent = true })
vim.keymap.set("n", "<space>p", builtin.find_files, { noremap = true, silent = true })
vim.keymap.set("n", "<space>o", builtin.lsp_document_symbols, { noremap = true, silent = true })
vim.keymap.set("n", "<space>O", builtin.lsp_dynamic_workspace_symbols, { noremap = true, silent = true })
vim.keymap.set("n", "<space>gd", builtin.lsp_definitions, { noremap = true, silent = true })
vim.keymap.set("n", "<space>gD", vim.lsp.buf.declaration, { noremap = true, silent = true })
vim.keymap.set("n", "<space>gi", builtin.lsp_implementations, { noremap = true, silent = true })
vim.keymap.set("n", "<space>gr", builtin.lsp_references, { noremap = true, silent = true })
vim.keymap.set("n", "<space>gt", builtin.lsp_type_definitions, { noremap = true, silent = true })
vim.keymap.set("n", "<space>ci", builtin.lsp_incoming_calls, { noremap = true, silent = true })
vim.keymap.set("n", "<space>co", builtin.lsp_outgoing_calls, { noremap = true, silent = true })
vim.keymap.set("n", "<space>b", builtin.buffers, { noremap = true, silent = true })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
