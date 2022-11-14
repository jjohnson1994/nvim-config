"
" Local Dependencies
"
" Fonts:
" A patched nerd font, JetBrains Mono Nerd Font is good
"
" DAP Adapters:
" node-debug2 and vscode-chrome-debug cloned and build at ~/Projects
"

set nocompatible              " be iMproved, required
filetype off                  " required
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'kshenoy/vim-signature' 
Plug 'tpope/vim-surround'
" Plug 'scrooloose/nerdtree' |
"     \ Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'nvim-tree/nvim-web-devicons'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*'}
Plug 'SmiteshP/nvim-navic'
Plug 'ThePrimeagen/refactoring.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'dracula/vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'folke/trouble.nvim'
Plug 'haydenmeade/neotest-jest'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'jjohnson1994/vim-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap'
Plug 'mhartington/oceanic-next'
Plug 'mxsdev/nvim-dap-vscode-js'
Plug 'neovim/nvim-lspconfig'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-neotest/neotest'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'onsails/lspkind.nvim'
Plug 'rafamadriz/friendly-snippets'
Plug 'rcarriga/nvim-dap-ui'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'sainnhe/sonokai'
Plug 'shaunsingh/nord.nvim'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'wfxr/minimap.vim', {'do': ':!brew install code-minimap'}
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'winston0410/range-highlight.nvim'
Plug 'winston0410/cmd-parser.nvim'

" Initialize plugin system
call plug#end()
filetype plugin indent on    " required
syntax on
"""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""
syntax enable           " Syntax Processing
filetype indent on      " load filetype-specific indent files
set autoread            " read when a file is changed from outside 
set autoindent
set backspace=indent,eol,start " Allow backspace over everything
set cmdheight=1
set cursorline          " highlight current line
set encoding=UTF-8
set foldmethod=syntax   
set nofoldenable
set hidden
set hlsearch            " highlight matches
set incsearch           " search as characters are entered
set lazyredraw          " redraw only when we need to.
set modifiable          " Make all buffers modifiable
set mouse=a
set nobackup
set noswapfile
set nowb
set nowrap              " Do Not Wrap
" set number              " Show line number
set relativenumber
set rnu
set showmatch           " highlight matching [{()}]
set signcolumn=yes      " Always show sign column
set so=7                " Give the cursor 7 line
set splitbelow
set splitright
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab " tab as 2 Spaces
set termguicolors
set updatetime=300
set wildmenu            " visual autocomplete for command menu

" THEME {{
colorscheme tokyonight-night

let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
" }}

" NERDTree {{
" let NERDTreeShowHidden=1
" map <C-n> :NERDTreeToggle<CR>
"
" " close vim if only nerdtree is left open
" " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
" " Hide Dir Arrows
" let NERDTreeDirArrowExpandable = "\u00a0"
" let NERDTreeDirArrowCollapsible = "\u00a0"
" " }} NERDTree
"
" " NERDTree Git {{
" let g:NERDTreeGitStatusUseNerdFonts = 1
" }}
"

"
" NvimTree
"
lua << EOF
require("nvim-tree").setup({
  actions = {
    open_file = {
      window_picker = {
        enabled = false
      }
    }
  },
  view = {
    signcolumn = 'yes',
    number = true,
    relativenumber = true,
  },
  renderer = {
    icons = {
      git_placement = 'signcolumn'
    }
  },
  respect_buf_cwd = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  diagnostics = {
    enabled = true
  }
})
EOF

map <C-n> :NvimTreeToggle<CR>

" Telescope {{
nnoremap <Leader>s <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <space>p <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <space>go <cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>
" nnoremap <space>go <cmd>lua require('telescope.builtin').treesitter()<CR>
nnoremap <space>gO <cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>
nnoremap <space>gd <cmd>lua require('telescope.builtin').lsp_definitions()<CR>
nnoremap <space>gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <space>gi <cmd>lua require('telescope.builtin').lsp_implementations()<CR>
nnoremap <space>gr <cmd>lua require('telescope.builtin').lsp_references()<CR>
nnoremap <space>gt <cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>
nnoremap <space>ci <cmd>lua require('telescope.builtin').lsp_incoming_calls	()<CR>
nnoremap <space>co <cmd>lua require('telescope.builtin').lsp_outgoing_calls	()<CR>
nnoremap <space>b <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

lua << EOF
require('telescope').setup {
}
require('telescope').load_extension('fzf')
EOF
" }}

" Nerd Commenter {{
filetype plugin on
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
" }} Nerd Commenter

" Bufferline {{
lua << EOF
require("bufferline").setup {
  options = {
    mode = "tabs",
    diagnostics = "nvim_lsp",
    diagnostics_update_on_insert = true
  }
}
EOF
" }}

" TODO
nnoremap <silent> ]g <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> [g <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <space>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ac <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <space>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>f <cmd>lua vim.lsp.buf.format()<CR><CR>
nnoremap <space>ff <cmd>lua vim.lsp.buf.format()<CR><CR>
" nmap <leader>qf  <Plug>(coc-fix-current)
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Treesitter {{
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
    'html',
    'javascript',
    'typescript',
    'json',
    'dockerfile',
    'css',
    'jsdoc',
    'scss',
    'tsx',
    'vim',
    'vue',
    'yaml',
    'lua',
    'graphql',
    'hcl',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}
EOF
" }}

" gitsigns {{
lua << EOF
require('gitsigns').setup()
EOF
" }}

" lualine {{
lua << EOF
require('lualine').setup {
  sections = {
    lualine_b = {},
    lualine_c = {{ 'filename', path = 1}}
  },
  inactive_sections = {
    lualine_c = {{ 'filename', path = 1}}
  }
}
EOF
" }}

" Comment {{
lua << EOF
require('Comment').setup()
EOF
" }}

" trouble {{
lua << EOF
require("trouble").setup { }

vim.keymap.set("n", "<space>tt", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<space>tD", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<space>td", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<space>tl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<space>tq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
EOF
" }}

"
" Mason
"
lua << EOF
require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = {
    "html",
    "jsonls",
    "sumneko_lua",
    "tsserver",
    "vimls",
    "tailwindcss",
    "volar",
    "cssls",
    "eslint",
    "emmet_ls",
    "yamlls",
    "terraformls",
    "dockerls"
  }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_lspconfig.setup_handlers({
  function (server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, bufnr)
        end
      end
  }
  end
})
EOF

" Navic {{
lua << EOF
require("nvim-navic")
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
EOF
" }}

" nvim-cmp {{
set completeopt=menu,menuone,noselect
set pumheight=10

lua <<EOF
  local cmp = require'cmp'
  local lspkind = require('lspkind')

  cmp.setup({
    formatting = {
      format = lspkind.cmp_format()
    },
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true })
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = "luasnip" },
      { name = 'buffer' },
    })
  })

  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' },
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
      { name = 'nvim_lsp' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
EOF
" }}

"
" Refactoring
"
lua << EOF
require('refactoring').setup({})
require("telescope").load_extension("refactoring")

vim.api.nvim_set_keymap(
	"v",
	"<space>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<space>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<space>rv",
	"<Esc><cmd>lua require('refactoring').debug.print_var({})<CR>",
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<space>rc",
	"<Esc><cmd>lua require('refactoring').debug.cleanup({})<CR>",
	{ noremap = true }
)
EOF

"
" Minimap
"
nnoremap <space>mt :MinimapToggle<CR>
let g:minimap_git_colors = 1

"
" DAP
"
noremap <space>db <cmd>lua require('dap').toggle_breakpoint()<CR>
noremap <space>dc <cmd>lua require('dap').continue()<CR>
noremap <space>do <cmd>lua require('dap').step_over()<CR>
noremap <space>di <cmd>lua require('dap').step_into()<CR>
noremap <space>dr <cmd>lua require('dap').run_to_cursor()<cr><CR>
noremap <space>du <cmd>lua require('dapui').toggle()<cr><CR>
noremap <space>dR <cmd>lua require('dap').repl.toggle()<CR>

lua << EOF
local dap = require('dap')
require("nvim-dap-virtual-text").setup()
require("dapui").setup()

require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  debugger_path = '/Users/jamesjohnson/Projects/vscode-js-debug', -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/Projects/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.adapters.node = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/Projects/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = {os.getenv("HOME") .. "/Projects/vscode-chrome-debug/out/src/chromeDebug.js"}
}

require('dap.ext.vscode').load_launchjs(
  nil,
  {
    node = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact'
    }
  }
)

EOF

"
" lausnip
"
lua << EOF
local ls = require('luasnip')
require("luasnip.loaders.from_vscode").lazy_load()
-- require("luasnip.loaders.from_snipmate").lazy_load()

ls.filetype_extend("all", { "_" })
EOF

" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'<expr>

"
" Autopairs
"
lua << EOF
require("nvim-autopairs").setup {}
EOF

"
" NeoTest
"
lua << EOF
require("neotest").setup({
  adapters = {
    require("neotest-jest")
  },
})
EOF

nnoremap <space>ta <cmd>lua require('neotest').run.attach()<CR>
nnoremap <space>tf <cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>
nnoremap <space>tF <cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>
nnoremap <space>tl <cmd>lua require('neotest').run.run_last()<cr>
nnoremap <space>tL <cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>
nnoremap <space>tn <cmd>lua require('neotest').run.run()<cr>
nnoremap <space>tN <cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>
nnoremap <space>to <cmd>lua require('neotest').output.open({ enter = true })<cr>
nnoremap <space>tS <cmd>lua require('neotest').run.stop()<cr>
nnoremap <space>ts <cmd>lua require('neotest').summary.toggle()<cr>

"
" range-highlight
"
lua << EOF
require'range-highlight'.setup{}
EOF

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
