return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		keys = {
			{
				"grd",
				function()
					vim.lsp.buf.definition()
				end,
				desc = "Hover",
			},
		},
	},
}
