return {
	{
		"neovim/nvim-lspconfig",
		keys = {
			{
				"K",
				function()
					vim.lsp.buf.hover()
				end,
				desc = "Hover",
			},
			{
				"grd",
				function()
					vim.lsp.buf.definition()
				end,
				desc = "Hover",
			},
		},
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim",
		},
		opts = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			return {
				ensure_installed = {
					"lua_ls",
					"vtsls",
					"prettierd",
					"stylua",
					"svelte",
					"eslint_d",
				},
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,
				},
			}
		end,
	},
}
