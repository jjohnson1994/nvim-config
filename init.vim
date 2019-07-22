set nocompatible              " be iMproved, required
filetype off                  " required
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'lifepillar/vim-gruvbox8'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'kshenoy/vim-signature' 
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-surround'
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
" Initialize plugin system
call plug#end()
filetype plugin indent on    " required
syntax on
"""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""
syntax enable           " Syntax Processing
set cursorline          " highlight current line
set backspace=indent,eol,start " Allow backspace over everything
set number              " Show line number
set modifiable          " Make all buffers modifiable
set nowrap              " Do Not Wrap
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab " tab as 2 Spaces
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set autoread            " read when a file is changed from outside 
set so=7                " Give the cursor 7 line
set nobackup
set nowb
set noswapfile
set hidden
set cmdheight=1
set updatetime=300
set mouse=a
set signcolumn=yes      " Always show sign column
set termguicolors
colorscheme gruvbox8

" NERDTree {{
map <C-n> :NERDTreeToggle<CR>
" auto open nerdtree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if only nerdtree is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }} NERDTree

" CtrlP {{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" }} CtrlP

" Nerd Commenter {{
filetype plugin on
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
" }} Nerd Commenter

" Ack Silver Searcher {{
map <Leader>s :Ack -ri ''<LEFT>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }} Ack Silver Searcher

" coc.nvim {{
let g:coc_global_extensions = [
    \'coc-git',
    \'coc-vetur',
    \'coc-lists',
    \'coc-yank',
    \'coc-marketplace'
    \'coc-pairs',
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
    \]

function! s:GoToDefinition()
  " Try Coc First
  if CocAction('jumpDefinition')
    return v:true
  endif
  " Try Tags Second
  let ret = execute("silent! normal \<C-]>")
  if ret[:5] =~ "Error"
    " Try Vim Last
    call searchdecl(expand('<cword>'))
  endif
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
    \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gj <Plug>(coc-git-nextchunk)
nmap <silent> gk <Plug>(coc-git-prevchunk)
nmap <silent> gd :call <SID>GoToDefinition()<CR>
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gx <Plug>(coc-fix-current)
nmap <silent> ga <Plug>(coc-codeaction)
nmap <silent> gs <Plug>(coc-git-chunkinfo)
nmap <silent> gm <Plug>(coc-git-commit)
nmap <silent> <C-f> :call CocAction('format')<CR>

map <Leader>p :CocList commands <CR>
map <Leader>o :CocList outline <CR>

set statusline+=%{coc#status()}
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

autocmd CursorHold * silent call CocActionAsync('highlight')
" }} coc.nvim

" gf {{
set path=.,src
set suffixesadd=.js,.jsx
function! LoadMainNodeModule(fname) 
  let nodeModules = "./node_modules/"
  let packageJsonPath = nodeModules . a:fname . "/package.json"
  if filereadable(packageJsonPath)
    return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
  else
    return nodeModules . a:fname
  endif
endfunction
set includeexpr=LoadMainNodeModule(v:fname)
" }} gf

" Guten Tags {{
set statusline+=%{gutentags#statusline()}
" }} Guten Tags

" Vim Vue {{
autocmd FileType vue syntax sync fromstart
" }} Vim Vue

" airline {{
let g:airline_theme='base16_monokai'
" }} airline
