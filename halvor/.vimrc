syntax on
filetype indent plugin on
set number
set wildmenu
autocmd FileType yaml setlocal ai ts=2 sw=2 et

call plug#begin()

Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'

call plug#end()
