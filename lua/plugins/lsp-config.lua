return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "vtsls", "svelte", "prettierd", "eslint_d" },
				automatic_installation = true,
			})

			local lspconfig = require("lspconfig")

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local function on_attach(client, bufnr)
				if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
					vim.lsp.inlay_hint.enable(true)
				end
			end

			lspconfig.vtsls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					typescript = {
						-- inlayHints = {
						-- 	parameterNames = { enabled = "all" },
						-- 	parameterTypes = { enabled = true },
						-- 	variableTypes = { enabled = true },
						-- 	propertyDeclarationTypes = { enabled = true },
						-- 	functionLikeReturnTypes = { enabled = true },
						-- 	enumMemberValues = { enabled = true },
						-- },
					},
					javascript = {
						-- inlayHints = {
						-- 	parameterNames = { enabled = "all" },
						-- 	parameterTypes = { enabled = true },
						-- 	variableTypes = { enabled = true },
						-- 	propertyDeclarationTypes = { enabled = true },
						-- 	functionLikeReturnTypes = { enabled = true },
						-- 	enumMemberValues = { enabled = true },
						-- },
					},
				},
			})

			lspconfig.svelte.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
		keys = {
			{
				"K",
				function()
					vim.lsp.buf.hover()
				end,
				desc = "Hover",
			},
		},
	},
}
