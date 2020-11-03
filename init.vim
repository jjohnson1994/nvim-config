set nocompatible              " be iMproved, required
filetype off                  " required
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'lifepillar/vim-gruvbox8'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'kshenoy/vim-signature' 
Plug 'tpope/vim-surround'
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'leafgarland/typescript-vim'

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
set backspace=indent,eol,start " Allow backspace over everything
set cmdheight=1
set cursorline          " highlight current line
set encoding=UTF-8
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
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab " tab as 2 Spaces
set termguicolors
set updatetime=300
set wildmenu            " visual autocomplete for command menu
colorscheme gruvbox8_hard

" NERDTree {{
map <C-n> :NERDTreeToggle<CR>
" close vim if only nerdtree is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }} NERDTree

" CtrlP {{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'
  let g:ctrlp_use_caching = 0
endif
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

map <Leader>r :%s//g<LEFT><LEFT>

" coc.nvim {{
    " \'coc-pairs',
let g:coc_global_extensions = [
    \'coc-git',
    \'coc-vetur',
    \'coc-lists',
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
    \]

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
    \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gj <Plug>(coc-git-nextchunk)
nmap <silent> gk <Plug>(coc-git-prevchunk)
nmap <silent> gd :call CocAction('jumpDefinition')<CR>
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

" Multi Cursor
nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

set statusline+=%{coc#status()}
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

autocmd CursorHold * silent call CocActionAsync('highlight')
" }} coc.nvim

" Vim Vue {{
autocmd FileType vue syntax sync fromstart
" }} Vim Vue

" airline {{
let g:airline_theme='base16_monokai'
" }} airline
