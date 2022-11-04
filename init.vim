set nocompatible              " be iMproved, required
filetype off                  " required
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'kshenoy/vim-signature' 
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'mfussenegger/nvim-dap'
Plug 'jjohnson1994/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'sainnhe/sonokai'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'dracula/vim'
Plug 'mhartington/oceanic-next'
Plug 'shaunsingh/nord.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'williamboman/mason.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'folke/trouble.nvim'
Plug 'SmiteshP/nvim-navic'
Plug 'onsails/lspkind.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'williamboman/nvim-lsp-installer'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*'}
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'ThePrimeagen/refactoring.nvim'

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
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

" close vim if only nerdtree is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Hide Dir Arrows
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
" }} NERDTree

" NERDTree Git {{
let g:NERDTreeGitStatusUseNerdFonts = 1
" }}

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
nnoremap <silent> [g <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> ]g <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ac <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>f <cmd>lua vim.lsp.buf.format()<CR><CR>
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

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
EOF
" }}

" nvim-lspconfig {{
lua << EOF

local servers = {
  html = {},
  jsonls = {},
  sumneko_lua = {},
  tsserver = {},
  vimls = {},
  tailwindcss = {},
  volar = {},
  cssls = {},
  eslint = {}
}

local function on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  require("nvim-navic").attach(client, bufnr)

  -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
  --
  -- require('lspconfig')[client.name].setup {
  --   capabilities = capabilities
  -- }
end

local lsp_installer_servers = require "nvim-lsp-installer.servers"

for server_name, _ in pairs(servers) do
  local server_available, server = lsp_installer_servers.get_server(server_name)

  if server_available then
    server:on_ready(function()
      -- local opts = vim.tbl_deep_extend("force", options, servers[server.name] or {})
      server:setup({
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        }
      })
    end)

    if not server:is_installed() then
      vim.notify('Installing', vim.log.levels.INFO, { title = server.name })
      server:install()
    end
  else
    vim.notify(server, vim.log.levels.ERROR, { title = name })
  end
end

EOF
" }}

" Navic {{
lua << EOF
require("nvim-navic")
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
EOF
" }}

" nvim-cmp {{
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Set up nvim-cmp.
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
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
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
-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")

-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>rv",
	"<Esc><cmd>lua require('refactoring').debug.print_var({})<CR>",
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>rc",
	"<Esc><cmd>lua require('refactoring').debug.cleanup({})<CR>",
	{ noremap = true }
)
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
