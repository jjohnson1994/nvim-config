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
      "<space>f<space>",
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
    -- todo current word
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
    {
      "<space>gd",
      "<cmd>FzfLua lsp_definitions<cr>",
      desc = "FzfLua lsp_definitions",
    },
    {
      "<space>gi",
      "<cmd>FzfLua lsp_definitions<cr>",
      desc = "FzfLua lsp_implementations",
    },
    {
      "<space>gr",
      "<cmd>FzfLua lsp_references<cr>",
      desc = " Lsp references",
    },
    {
      "<space>gt",
      "<cmd>FzfLua lsp_typedefs<cr>",
      desc = "Lsp type definitions",
    },
    {
      "<space>lS",
      "<cmd>FzfLua lsp_live_workspace_symbols<cr>",
      desc = "Lsp workspace symbols",
    },
    {
      "<space>ls",
      "<cmd>FzfLua lsp_document_symbols<cr>",
      desc = "Lsp document symbols",
    },
    {
      "<space>ca",
      "<cmd>FzfLua lsp_code_actions<cr>",
      desc = "Lsp code actions",
    },
  },
}
