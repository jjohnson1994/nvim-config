return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "FzfLua",
  keys = {
    { "<leader><leader>", "<cmd>FzfLua resume<cr>", desc = "Resume last search" },
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find buffers" },
    { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help tags" },
    { "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
    { "<leader>fc", "<cmd>FzfLua commands<cr>", desc = "Commands" },
    { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
    { "<leader>fr", "<cmd>FzfLua lsp_references<cr>", desc = "LSP references" },
    { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Document symbols" },
    { "<leader>fw", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "Workspace symbols" },
    { "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document diagnostics" },
    { "<leader>fD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace diagnostics" },
    { "<leader>fm", "<cmd>FzfLua git_status<cr>", desc = "Git modified files" },
    -- LSP navigation uses Neovim defaults (grr, gra, grn, gri, grt, gO)
    -- Use <leader>f* mappings above for FZF versions if preferred
  },
  opts = {
    fzf_opts = {
      ["--cycle"] = true, -- Enable cyclic scrolling (wrap around when navigating)
    },
    defaults = {
      file_icons = true,
      git_icons = true,
    },
    keymap = {
      fzf = {
        ["alt-a"] = "select-all",
        ["alt-d"] = "deselect-all",
      },
    },
    winopts = {
      height = 0.85,
      width = 0.85,
      preview = {
        default = "bat",
        border = "rounded",
        wrap = "nowrap",
        hidden = "nohidden",
        vertical = "down:45%",
        horizontal = "right:50%",
        layout = "flex",
        flip_columns = 120,
      },
    },
    files = {
      prompt = "Files❯ ",
      cwd_prompt = false, -- Hide full path from prompt
    },
    grep = {
      prompt = "Grep❯ ",
      input_prompt = "Grep For❯ ",
    },
  },
}
