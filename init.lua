local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  checker = { enabled = true },
  { "rcarriga/nvim-notify" },
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  { "folke/neoconf.nvim",   cmd = "Neoconf" },
  "folke/neodev.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<tab>",
            node_incremental = "<tab>",
            scope_incremental = false,
            node_decremental = "<S-tab>",
          },
        },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd([[colorscheme tokyonight-moon]])
    end,
  },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  {
    "hrsh7th/nvim-cmp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    -- build = "make install_jsregexp",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      local ls = require("luasnip").setup()

      -- vim.keymap.set({ "i" }, "<Tab>", function()
      -- return ls.jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      -- end, { expr = true, silent = true })

      -- vim.keymap.set({ "s" }, "<Tab>", function()
      --   ls.jump(1)
      -- end)

      -- vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
      --   ls.jump(-1)
      -- end)

      -- vim.keymap.set({ "i", "s" }, "<C-E>", function()
      -- 	if ls.choice_active() then
      -- 		ls.change_choice(1)
      -- 	end
      -- end, { silent = true })
    end,
  },
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  { "saadparwaiz1/cmp_luasnip" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
    config = function()
      require("neo-tree").setup({
        source_selector = {
          winbar = false,
          statusline = false,
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
        },
      })
    end,
  },
  { "echasnovski/mini.nvim",   version = "*" },
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    after = "catppuccin",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        dim_inactive = {
          enabled = true,
        },
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = { "italic" },
          keywords = { "italic" },
        },
        integrations = {
          cmp = true,
          bufferline = true,
          dashboard = true,
          gitsigns = true,
          indent_blankline = { enabled = true },
          mini = {
            enabled = true,
            indentscope_color = "", -- catppuccin color (eg. `lavender`) Default: text
          },
          neotree = true,
          noice = true,
          notifier = true,
          dap = true,
          dap_ui = true,
          notify = true,
          nvimtree = true,
          treesitter_context = true,
          treesitter = true,
          lsp_trouble = true,
          telescope = true,
          which_key = true,
        },
      })

      -- vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  { "lewis6991/gitsigns.nvim" },
  { "RRethy/vim-illuminate" },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- TODO
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
  },
  { "windwp/nvim-ts-autotag" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        config = {
          header = {
            "neojim neojim neojim neojim",
            "neojim neojim neojim neojim",
            "neojim neojim neojim neojim",
            "neojim neojim neojim neojim",
            "",
            "",
          },
        },
      })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup()
    end,
  },
  {
    "SmiteshP/nvim-navic",
  },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   config = function()
  --     local null_ls = require("null-ls")
  --
  --     local lsp_formatting = function(bufnr)
  --       vim.lsp.buf.format({
  --         filter = function(client)
  --           -- apply whatever logic you want (in this example, we'll only use null-ls)
  --           return client.name ~= "tsserver" and client.name ~= "volar"
  --         end,
  --         bufnr = bufnr,
  --         timeout_ms = 2000
  --       })
  --     end
  --
  --     local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  --
  --     null_ls.setup({
  --       sources = {
  --         null_ls.builtins.code_actions.eslint,
  --         null_ls.builtins.formatting.eslint,
  --         null_ls.builtins.diagnostics.eslint,
  --         null_ls.builtins.code_actions.gitsigns,
  --       },
  --       on_attach = function(client, bufnr)
  --         if client.supports_method("textDocument/formatting") then
  --           vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --           vim.api.nvim_create_autocmd("BufWritePre", {
  --             group = augroup,
  --             buffer = bufnr,
  --             callback = function()
  --               lsp_formatting(bufnr)
  --             end,
  --           })
  --         end
  --       end,
  --     })
  --   end,
  -- },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        vue = { "eslint_d" },
        typescript = { "eslint_d" },
        javascript = { "eslint_d" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        format_on_save = {
          timeout_ms = 2500,
          lsp_fallback = false,
        },
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { { "eslint_d" } },
          typescript = { { "eslint_d" } },
          vue = { { "eslint_d" } },
        },
      })

      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ async = true, lsp_fallback = true, range = range })
      end, { range = true })
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest"),
        },
      })

      vim.keymap.set(
        "n",
        "<space>ta",
        "<cmd>lua require('neotest').run.attach()<CR>",
        { silent = true, noremap = true }
      )

      vim.keymap.set(
        "n",
        "<space>tf",
        "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
        { silent = true, noremap = true }
      )
      vim.keymap.set(
        "n",
        "<space>tF",
        "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set(
        "n",
        "<space>tl",
        "<cmd>lua require('neotest').run.run_last()<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set(
        "n",
        "<space>tL",
        "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set(
        "n",
        "<space>tn",
        "<cmd>lua require('neotest').run.run()<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set(
        "n",
        "<space>tN",
        "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set(
        "n",
        "<space>to",
        "<cmd>lua require('neotest').output.open({ enter = true })<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set(
        "n",
        "<space>tS",
        "<cmd>lua require('neotest').run.stop()<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set(
        "n",
        "<space>ts",
        "<cmd>lua require('neotest').summary.toggle()<cr>",
        { silent = true, noremap = true }
      )
    end,
  },
  { "chentoast/marks.nvim" },
  {
    "b0o/SchemaStore.nvim",
    config = function()
      require("lspconfig").jsonls.setup({
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end,
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   config = function()
  --     require("treesitter-context").setup()
  --   end,
  -- },
  {
    "dmmulroy/ts-error-translator.nvim",
    config = function()
      require("ts-error-translator").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
})

-- < which key
local whichkey = require("which-key")
-- which key >

vim.notify = require("notify")

-- <Nvim-comp
-- gray
vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
-- blue
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
-- light blue
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
-- pink
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
-- front
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })

local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}
local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        -- that way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" }, -- For luasnip users.
    { name = "path" },
  }, {
    { name = "buffer" },
  }),
  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end,
  },
  experimental = {
    ghost_text = true,
  },
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = "buffer" },
  }),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

-- nvim-comp >

-- < mini
require("mini.ai").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.basics").setup()
require("mini.bracketed").setup()
require("mini.comment").setup({
  options = {
    custom_commentstring = function()
      return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
    end,
  },
})
-- TODO hipattern match without `:`
require("mini.hipatterns").setup()
require("mini.jump").setup()
require("mini.indentscope").setup({
  event = "LazyFile",
  opts = {
    -- symbol = "▏",
    symbol = "│",
    options = { try_as_border = true },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
})
-- mini >

-- < nvim-treesitter
require("nvim-treesitter.configs").setup({
  -- Install the parsers for the languages you want to comment in
  -- Here are the supported languages:
  ensure_installed = {},
})

require("ts_context_commentstring").setup({
  enable = true,
  enable_autocmd = false,
})
-- treesitter >

-- < nvim lsp configs

-- Setup language servers.
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local lsp_formatting = function(bufnr)
      vim.lsp.buf.format({
        filter = function(client)
          -- apply whatever logic you want (in this example, we'll only use null-ls)
          return client.name ~= "tsserver" and client.name ~= "volar"
        end,
        bufnr = bufnr,
        timeout_ms = 2000,
      })
    end

    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              lsp_formatting(bufnr)
            end,
          })
        end
      end,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
        },
      },
    })
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["rust_analyzer"] = function()
    require("rust-tools").setup({})
  end,
})

require("lspconfig")

local icons = {
  diagnostics = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
  },
}

for name, icon in pairs(icons.diagnostics) do
  name = "DiagnosticSign" .. name
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- whichkey.register({
--   ["[d"] = { vim.diagnostic.goto_prev, '' },
--   ["]d"] = { vim.diagnostic.goto_next, '' },
-- })

-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>ld', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    -- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    -- -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)

    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set("n", "<space>lf", function()
    --   -- TODO call formatter
    -- vim.lsp.buf.format({
    --   filter = function(client)
    --     return client.name ~= "tsserver" and client.name ~= "volar"
    --   end,
    --   bufnr = bufnr,
    --   timeout_ms = 2000
    -- })
    -- end, opts)
  end,
})
-- nvim lsp conf >

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<space>w", ":w<CR>")
map("n", "<space>q", ":q<CR>")
map("n", "<space>x", ":x<CR>")

-- Window movement
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")

-- buffers
map("n", "<space>bd", "::b#|bd#<CR>")
map("n", "<space>bb", ":e #<CR>")

whichkey.register({
  ["<space>e"] = { "<cmd>Neotree toggle<cr>", "Neotree Toggle" },
})

whichkey.register({
  ["<space>c"] = {
    name = "code",
    f = { "<cmd>:format<cr>", "format" },
    l = {
      function()
        local lint = require("lint")
        lint.try_lint()
      end,
      "lint",
    },
  },
})

vim.opt.relativenumber = true

-- bufferline <
vim.opt.termguicolors = true
require("bufferline").setup({
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
})
-- bufferline >

-- general vi config <
vim.opt.compatible = false
vim.opt.syntax = "enable"
vim.opt.autoread = true
vim.opt.autoindent = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.cmdheight = 1
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"
vim.opt.foldmethod = "syntax"
vim.opt.foldenable = false
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- vim.opt.lazyredraw = true
vim.opt.modifiable = true
vim.opt.mouse = "a"
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.wb = false
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.showmatch = true
vim.opt.signcolumn = "yes"
vim.opt.so = 7
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.updatetime = 300
vim.opt.wildmenu = true
vim.opt.pumblend = 10
vim.opt.pumheight = 10
-- general vim config >

-- git signs <
local gitsigns = require("gitsigns").setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    -- map('n', ']g', , { expr = true })

    whichkey.register({
      ["]g"] = {
        function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end,
        "Hunk forwards",
      },
    })

    whichkey.register({
      ["[g"] = {
        function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end,
        "Hunk backwards",
      },
    })

    -- Actions
    -- map('n', '<leader>hs', gs.stage_hunk)
    -- map('n', '<leader>hr', gs.reset_hunk)
    -- map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
    -- map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
    -- map('n', '<leader>hS', gs.stage_buffer)
    -- map('n', '<leader>hu', gs.undo_stage_hunk)
    -- map('n', '<leader>hR', gs.reset_buffer)
    -- map('n', '<leader>hp', gs.preview_hunk)
    -- map('n', '<leader>hb', function() gs.blame_line { full = true } end)
    -- map('n', '<leader>tb', gs.toggle_current_line_blame)
    -- map('n', '<leader>hd', gs.diffthis)
    -- map('n', '<leader>hD', function() gs.diffthis('~') end)
    -- map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end,
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 200,
  },
})
-- > git signs

-- telescope <
local lga_actions = require("telescope-live-grep-args.actions")
require("telescope").setup({
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = {      -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    },
  },
})

require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<space>ff", builtin.git_files, {})
vim.keymap.set("n", "<space>fg", builtin.live_grep, {})
vim.keymap.set("n", "<space>fa", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<space>fb", builtin.buffers, {})
vim.keymap.set("n", "<space>fh", builtin.help_tags, {})
vim.keymap.set("n", "<space>fr", builtin.registers, {})
vim.keymap.set("n", "<space>fm", builtin.marks, {})
vim.keymap.set("n", "<space>fc", function()
  builtin.colorscheme({ enable_preview = true })
end, {})

vim.keymap.set("n", "<space>ls", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<space>lS", builtin.lsp_dynamic_workspace_symbols, {})
-- vim.keymap.set('n', '<space>lD', builtin.diagnostics, {})
vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
vim.keymap.set("n", "gt", builtin.lsp_type_definitions, {})
vim.keymap.set("n", "gr", builtin.lsp_references, {})
vim.keymap.set("n", "gi", builtin.lsp_implementations, {})
-- telescope >

-- trouble <
vim.keymap.set("n", "<leader>xx", function()
  require("trouble").toggle()
end)

whichkey.register({
  ["<space>x"] = {
    name = "Trouble",
    d = {
      function()
        require("trouble").toggle("document_diagnostics")
      end,
      "Document Diagnostics",
    },
    w = {
      function()
        require("trouble").toggle("workspace_diagnostics")
      end,
      "Workspace Diagnostics",
    },
    q = {
      function()
        require("trouble").toggle("quickfix")
      end,
      "Quickfix",
    },
    l = {
      function()
        require("trouble").toggle("loclist")
      end,
      "Loclist",
    },
    R = {
      function()
        require("trouble").toggle("lsp_references")
      end,
      "LSP References",
    },
  },
})
-- trouble >

-- navic <
local navic = require("nvim-navic").setup({
  icons = {
    File = "󰈙 ",
    Module = " ",
    Namespace = "󰌗 ",
    Package = " ",
    Class = "󰌗 ",
    Method = "󰆧 ",
    Property = " ",
    Field = " ",
    Constructor = " ",
    Enum = "󰕘",
    Interface = "󰕘",
    Function = "󰊕 ",
    Variable = "󰆧 ",
    Constant = "󰏿 ",
    String = "󰀬 ",
    Number = "󰎠 ",
    Boolean = "◩ ",
    Array = "󰅪 ",
    Object = "󰅩 ",
    Key = "󰌋 ",
    Null = "󰟢 ",
    EnumMember = " ",
    Struct = "󰌗 ",
    Event = " ",
    Operator = "󰆕 ",
    TypeParameter = "󰊄 ",
  },
  lsp = {
    auto_attach = true,
  },
  highlight = true,
})

-- navic >
-- lua line <
function lsp_clients()
  -- local formatters = require("conform").list_formatters()
  -- vim.list_extend(buf_client_names, formatters)

  local linters = require("lint").get_running()

  if #linters == 0 then
    return "󰦕"
  end

  return "󱉶 " .. table.concat(linters, ", ")
end

-- TODO mode status line @recording (see Noice)
require("lualine").setup({
  winbar = {
    lualine_b = {
      { "filename", file_status = false, path = 1 },
    },
    lualine_c = {
      {
        "navic",
        color_correction = nil,
        navic_opts = nil,
      },
    },
  },
  inactive_winbar = {
    lualine_b = {
      { "filename", file_status = false, path = 1 },
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = {},
    lualine_x = {
      lsp_clients,
      "encoding",
      "fileformat",
      {
        "filetype",
        on_click = function()
          -- require("notify")("My super important message")
        end,
      },
    },
    lualine_y = { "progress" },
    lualine_z = {
      {
        "location",
        on_click = function()
          return vim.ui.input({
            prompt = "Go to line",
          }, function(input)
            if input then
              print("You entered " .. input)
              vim.cmd(":" .. input)
            else
              print("You cancelled")
            end
          end)
        end,
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  options = {
    theme = "catppuccin",
  },
})

vim.o.laststatus = 3 -- have a global statusline at the bottom
-- lua line >

-- todo comments <
require("todo-comments").setup()
-- TODO hipattern match without `:`
vim.keymap.set("n", "<space>ft", ":TodoTelescope<cr>", {})
-- todo comments >

-- nvim-ts-autotoag <
require("nvim-ts-autotag").setup()
-- nvim-ts--autotag >

-- indent blank line <
-- TODO does not work
require("ibl").setup({
  indent = {
    char = "│",
    tab_char = "│",
  },
  scope = { enabled = false },
  exclude = {
    filetypes = {
      "help",
      "dashboard",
      "neo-tree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
  },
})
-- indent blank line >

-- nvim-treesitter-text-objects <
-- TODO improve this
require("nvim-treesitter.configs").setup({
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- You can also use captures from other query groups like `locals.scm`
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ["@parameter.outer"] = "v", -- charwise
        ["@function.outer"] = "V", -- linewise
        ["@class.outer"] = "<c-v>", -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = true,
    },
  },
})
-- nvim-tree-sitter-text-objects >

-- noice <
-- TODO top of screen
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false,      -- use a classic bottom cmdline for search
    command_palette = true,     -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,         -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false,     -- add a border to hover docs and signature help
  },
})
-- noice >

-- marks <
require("marks").setup()
-- marks >
