set nocompatible              " be iMproved, required
filetype off                  " required
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'kshenoy/vim-signature' 
Plug 'tpope/vim-surround'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'scrooloose/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'tomasiser/vim-code-dark'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-test/vim-test'
Plug 'mfussenegger/nvim-dap'
" Plug 'ryanoasis/vim-devicons'
Plug 'jjohnson1994/vim-devicons'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/sonokai'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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
set number              " Show line number
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
colorscheme sonokai
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

" FZF {{
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

map <C-p> :GFiles<CR>
map <Leader>s :Ag<CR>
" }} FZF

" Nerd Commenter {{
filetype plugin on
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
" }} Nerd Commenter

" Ack Silver Searcher {{
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }} Ack Silver Searcher

map <Leader>r :%s//g<LEFT><LEFT>

" Vim Vue {{
autocmd FileType vue syntax sync fromstart
" }} Vim Vue

" Bufferline {{
lua << EOF
require("bufferline").setup{
  options = {
    mode = "tabs",
    diagnostics = "nvim_lsp"
  }
}
EOF
" }}

" nvim-lspconfig {{
lua << EOF
require("nvim-lsp-installer").setup {
  automatic_installation = true
}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  'tsserver',
  'bashls' ,
  'volar',
  'graphql',
  'eslint',
  'jdtls',
  'cssls',
  'jsonls',
  'terraformls',
  'yamlls',
  'html'
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
EOF
"}}

" nvim-cmp {{
lua << EOF
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
EOF
" }}

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
    'typescript',
    'vim',
    'vue',
    'yaml'
  }
}
EOF
" }}

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
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
