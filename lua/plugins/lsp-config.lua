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
			-- {
			-- 	"<space>ca",
			-- 	function()
			-- 		vim.lsp.buf.code_action()
			-- 	end,
			-- 	desc = "Code action",
			-- },
			{
				"gK",
				function()
					vim.lsp.buf.signature_help()
				end,
				desc = "Signature help",
			},
			{
				"gd",
				function()
					vim.lsp.buf.definition()
				end,
				desc = "Definition",
			},
			{
				"gD",
				function()
					vim.lsp.buf.declaration()
				end,
				desc = "Declaration",
			},
			{
				"<space>rn",
				function()
					vim.lsp.buf.rename()
				end,
				desc = "Rename",
			},
		},
	},
}
