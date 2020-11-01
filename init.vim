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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
Plug 'tomasiser/vim-code-dark'

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
set encoding=UTF-8
set termguicolors
colorscheme codedark

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
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

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
" let g:coc_global_extensions = [
"     \'coc-git',
"     \'coc-vetur',
"     \'coc-lists',
"     \'coc-yank',
"     \'coc-marketplace'
"     \'coc-tsserver',
"     \'coc-eslint',
"     \'coc-highlight',
"     \'coc-tag',
"     \'coc-snippets',
"     \'coc-svg',
"     \'coc-css',
"     \'coc-syntax',
"     \'coc-svelte',
"     \]

" don't give |ins-completion-menu| messages.
set shortmess+=c

" function! s:GoToDefinition()
"   " Try Coc First
"   if CocAction('jumpDefinition')
"     return v:true
"   endif
"   " Try Tags Second
"   let ret = execute("silent! normal \<C-]>")
"   if ret[:5] =~ "Error"
"     " Try Vim Last
"     call searchdecl(expand('<cword>'))
"   endif
" endfunction

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
let g:airline_theme='codedark'
" }} airline
