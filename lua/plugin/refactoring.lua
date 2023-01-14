local refactoring = require('refactoring')

refactoring.setup({})

require("telescope").load_extension("refactoring")

vim.keymap.set("v", "<leader>rr", refactoring.select_refactor, { noremap = true, silent = true, expr = false })

