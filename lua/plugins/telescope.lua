return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
    },
    config = function()
      local lga_actions = require("telescope-live-grep-args.actions")

      require("telescope").setup({
        extensions = {
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              },
            },
          },
        },
      })

      require("telescope").load_extension("live_grep_args")
      require("telescope").load_extension("fzf")
    end,
    keys = {
      {
        "<space>fa",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Live grep with args",
      },
      {
        "<space>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Find buffers",
      },
      {
        "<space>fc",
        function()
          require("telescope-live-grep-args.shortcuts").grep_word_under_cursor()
        end,
        desc = "Grep word under cursor",
      },
      {
        "<space>ff",
        function()
          require("telescope.builtin").git_files()
        end,
        desc = "Git files",
      },
      {
        "<space>fg",
        function()
          require("telescope.builtin").live_grep({
            glob_pattern = { "!**/*.png", "!**/*.jpg", "!**/*.svg" },
          })
        end,
        desc = "Live grep",
      },
      {
        "<space>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Help",
      },
      {
        "<space>fm",
        function()
          require("telescope.builtin").marks()
        end,
        desc = "Marks",
      },
      {
        "<space>fr",
        function()
          require("telescope.builtin").registers()
        end,
        desc = "Registers",
      },
      {
        "<space>gd",
        function()
          require("telescope.builtin").lsp_definitions()
        end,
        desc = "Lsp definitions",
      },
      {
        "<space>gi",
        function()
          require("telescope.builtin").lsp_implementations()
        end,
        desc = "Lsp implementations",
      },
      {
        "<space>gr",
        function()
          require("telescope.builtin").lsp_references()
        end,
        desc = " Lsp references",
      },
      {
        "<space>gt",
        function()
          require("telescope.builtin").lsp_type_definitions()
        end,
        desc = "Lsp type definitions",
      },
      {
        "<space>lS",
        function()
          require("telescope.builtin").lsp_dynamic_workspace_symbols()
        end,
        desc = "Lsp workspace symbols",
      },
      {
        "<space>ls",
        function()
          require("telescope.builtin").lsp_document_symbols()
        end,
        desc = "Lsp document symbols",
      },
    },
  },
}
