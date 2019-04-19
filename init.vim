
filetype plugin indent off

let mapleader = "\<Space>"
"let g:python_host_prog = '/usr/bin/python2'
"let g:python3_host_prog = expand('~/.pyenv/versions/neovim/bin/python3')

" lint
let g:indent_guides_enable_on_vim_startup = 1
let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '--'
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass

" airline
let g:airline_theme = 'wombat'
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#ale#error_symbol = '? '
let g:airline#extensions#ale#warning_symbol = '? '
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1

set mouse=a
set fileformats=unix,dos,mac
set termguicolors
set fileencodings=ucs-bombs,utf-8,euc-jp,cp932
set ambiwidth=double
set noswapfile
set hidden
set clipboard+=unnamedplus
set number
set list
set listchars=tab:>-,trail:*,nbsp:+
set smartindent
set visualbell
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set ignorecase
set smartcase
set showtabline=2
set incsearch
set hlsearch
"set noshowmode

autocmd QuickFixCmdPost *grep* cwindow
nnoremap j gj
nnoremap k gk
nmap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>g :silent grep! -ilr <C-r><C-w> .<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :FZF<CR>
imap <Leader>e <esc>
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

call plug#begin('~/.config/nvim')
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf'
Plug 'rhysd/accelerated-jk'
Plug 'Townk/vim-autoclose'
Plug 'tomasr/molokai'
call plug#end()

syntax on
colorscheme molokai

filetype plugin indent on
