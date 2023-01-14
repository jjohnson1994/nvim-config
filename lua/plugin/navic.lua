require("nvim-navic")
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

