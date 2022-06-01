set nocompatible              " be iMproved, required
filetype off                  " required
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'kshenoy/vim-signature' 
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'mfussenegger/nvim-dap'
Plug 'jjohnson1994/vim-devicons'
Plug 'sainnhe/sonokai'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/telescope-coc.nvim'

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

" Telescope {{
nnoremap <Leader>s <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <space>p <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <space>go <cmd>lua require('telescope.builtin').treesitter()<CR>
nnoremap <space>gd :Telescope coc definitions<CR>
nnoremap <space>gi :Telescope coc implementations<CR>
nnoremap <space>gr :Telescope coc references<CR>
nnoremap <space>gt :Telescope coc declarations<CR>
nnoremap <space>b <cmd>lua require('telescope.builtin').buffers()<CR>

lua << EOF
require('telescope').setup {
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
EOF
" }}

" Nerd Commenter {{
filetype plugin on
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
" }} Nerd Commenter

" Bufferline {{
lua << EOF
require("bufferline").setup{
  options = {
    mode = "tabs",
    diagnostics = "coc"
  }
}
EOF
" }}

" Coc-nvim {{
let g:coc_global_extensions = [
    \'coc-git',
    \'coc-vetur',
    \'coc-lists',
    \'coc-emmet',
    \'coc-yank',
    \'coc-marketplace',
    \'coc-json',
    \'coc-html',
    \'coc-tsserver',
    \'coc-eslint',
    \'coc-highlight',
    \'coc-tag',
    \'coc-snippets',
    \'coc-svg',
    \'coc-css',
    \'coc-syntax',
    \'coc-yaml',
    \'coc-prettier',
    \'coc-java',
    \'coc-pairs',
    \'coc-phpls',
    \'coc-graphql'
    \]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
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
    'yaml',
    'lua',
    'graphql',
    'hcl'
  },
  highlight = {
    enable = true,
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
lua << END
require('lualine').setup()
END
" }}

" Comment {{
lua << EOF
require('Comment').setup()
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
