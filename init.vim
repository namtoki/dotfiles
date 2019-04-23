
filetype plugin indent off

let mapleader = "\<Space>"

" Python path
let g:python_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python2)/bin/python") || echo -n $(which python2)')
let g:python3_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python3)/bin/python") || echo -n $(which python3)')

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
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'base16'

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:UltiSnipsExpandTrigger = '<C-n>'
let g:UltiSnipsJumpForwardTrigger = '<C-n>'
let g:UltiSnipsJumpBackwardTrigger = '<C-p>'
let g:EclimCompletionMethod = 'omnifunc'

set mouse=a
set fileformats=unix,dos,mac
set termguicolors
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
Plug 'moll/vim-node'
Plug 'othree/yajs.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
call plug#end()

syntax on
colorscheme molokai

filetype plugin indent on
