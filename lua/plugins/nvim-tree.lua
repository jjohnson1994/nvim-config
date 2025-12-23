return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
	keys = {
		{ "<leader>e", "<cmd>NvimTreeFindFile<cr>", desc = "Toggle file explorer at current file" },
		{ "<leader>E", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
	},
	opts = {
		disable_netrw = true,
		hijack_netrw = true,
		respect_buf_cwd = true,
		sync_root_with_cwd = true,
		view = {
			width = 35,
			side = "left",
		},
		renderer = {
			group_empty = true,
			highlight_git = true,
			icons = {
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
					diagnostics = true,
				},
			},
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			show_on_open_dirs = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		filters = {
			dotfiles = false,
			custom = { ".git", "node_modules", ".cache" },
		},
		git = {
			enable = true,
			ignore = false,
		},
		actions = {
			open_file = {
				quit_on_open = false,
				window_picker = {
					enable = true,
				},
			},
		},
		update_focused_file = {
			enable = true,
			update_root = true,
		},
	},
}
