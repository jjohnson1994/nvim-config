return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({
			keymap = {
				fzf = {
					["ctrl-q"] = "select-all+accept",
				},
			},
		})
	end,
	keys = {
		{
			"<space><space>",
			"<cmd>FzfLua resume<cr>",
			desc = "FzfLua resume",
		},
		{
			"<space>ff",
			"<cmd>FzfLua files<cr>",
			desc = "FzfLua files",
		},
		{
			"<space>fb",
			"<cmd>FzfLua buffers<cr>",
			desc = "FzfLua buffers",
		},
		{
			"<space>fg",
			"<cmd>FzfLua live_grep<cr>",
			desc = "FzfLua live_grep",
		},
		{
			"<space>fa",
			"<cmd>FzfLua live_grep_glob<cr>",
			desc = "FzfLua live_grep_glob",
		},
		{
			"<space>fc",
			"<cmd>FzfLua grep_cword<cr>",
			desc = "FzfLua grep_cword",
		},
		{
			"<space>fh",
			"<cmd>FzfLua helptags<cr>",
			desc = "FzfLua helptags",
		},
		{
			"<space>fm",
			"<cmd>FzfLua marks<cr>",
			desc = "FzfLua marks",
		},
		{
			"<space>fr",
			"<cmd>FzfLua registers<cr>",
			desc = "FzfLua registers",
		},
		-- lsp
		{
			"gri",
			"<cmd>FzfLua lsp_implementation<cr>",
			desc = "Lsp implementation",
		},
		{
			"grr",
			"<cmd>FzfLua lsp_references<cr>",
			desc = "Lsp references",
		},
		{
			"grt",
			"<cmd>FzfLua lsp_typedefs<cr>",
			desc = "Lsp type definitions",
		},
		{
			"gO",
			"<cmd>FzfLua lsp_document_symbols<cr>",
			desc = "Lsp document symbols",
		},
		{
			"gP",
			"<cmd>FzfLua lsp_live_workspace_symbols<cr>",
			desc = "Lsp workspace symbols",
		},
		{
			"gra",
			"<cmd>FzfLua lsp_code_actions<cr>",
			desc = "Lsp code actions",
		},
	},
}
