filetype on
filetype plugin indent off
let mapleader = "\<Space>"

" Path
" ====
let g:python_host_prog = system('echo -n $(which python)')
let g:python3_host_prog = system('echo -n $(which python3)')

" Appearance
" ==========
set noshowmode
set ambiwidth=single
set laststatus=2
set list
set listchars=tab:>-,trail:*,nbsp:+
set cursorcolumn
set cursorline
set norelativenumber
set nowrap
set number
set showtabline=2
set t_Co=256
set visualbell

" Status Line
" ===========
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" Git
" ===
let g:gitgutter_override_sign_column_highlight=0
highlight SignColumn ctermbg=black
let g:gitgutter_sign_added='＋'
let g:gitgutter_sign_modified='＋'
let g:gitgutter_sign_removed='－'
let g:gitgutter_sign_removed_first_line='－'
let g:gitgutter_sign_modified_removed='＋'
highlight GitGutterAdd ctermfg=008000 ctermbg=black
highlight GitGutterChange ctermfg=008000 ctermbg=black
highlight GitGutterDelete ctermfg=red ctermbg=black
highlight GitGutterChangeDelete ctermfg=008000 ctermbg=black

" Operability
" ===========
set backspace=indent,eol,start
set hidden
set hlsearch
set ignorecase
set incsearch
set smartcase
set smartindent
set smarttab
set mouse=a
augroup operability
    autocmd!
    autocmd FileType c,cpp,java setl cindent
augroup END
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
let g:comfortable_motion_interval=2400.0/60
let g:comfortable_motion_friction=100.0
let g:comfortable_motion_air_drag=6.0

" Setting
" =======
set fileformats=unix,dos,mac
set lazyredraw
set re=1
set clipboard^=unnamedplus
set noswapfile
set title
set ttyfast
set tags=.tags,./tags;

" Mapping
" =======
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
nmap <ESC><ESC> :nohlsearch<CR>
nmap <Leader>m :Search <C-r><C-w><CR>
nmap <Leader>M :SearchReset<CR>
nmap <Leader>t :!ctags -R<CR>
nmap <Leader>c :copen<CR>
nmap <Leader>q :q!<CR>
nmap <Leader>w :w<CR>
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>f :FZF<CR>
nmap <Leader>g :Ag <C-r><C-w> --path-to-ignore .ignore<CR>
nmap <Leader>G :Ag <C-r>+ --path-to-ignore .ignore<CR>

set updatetime=500
augroup vimrc
    autocmd!
    au CursorHold * LspHover
augroup END
let g:neocomplcache_enable_at_startup=1
set signcolumn=yes

" VIM-LSP
" =======
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" Plugins
" =======
call plug#begin('~/.config/nvim')
" Operability
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'ryanolsonx/vim-lsp-python'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf'
Plug 'yuttie/comfortable-motion.vim'
Plug 'jacquesbh/vim-showmarks'
Plug 'Townk/vim-autoclose'
Plug 'rhysd/accelerated-jk'
" Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/MultipleSearch'
Plug 'Shougo/neocomplcache'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" HTML/CSS
Plug 'ap/vim-css-color'
" Other
Plug 'wordijp/NeoDebug'
call plug#end()

syntax on
colorscheme molokai
filetype plugin indent on
