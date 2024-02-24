" --------------------------------------------------
"                   Plugins 
" --------------------------------------------------

" Auto-install vim-plug (vim plugin manager)
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Must have
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'prabirshrestha/vim-lsp' " Turns Vim into an LSP client
Plug 'mattn/vim-lsp-settings' " For easy/automatic installation and configuration of LSP servers 
Plug 'tpope/vim-surround'
Plug 'https://github.com/stefandtw/quickfix-reflector.vim'
Plug 'jremmen/vim-ripgrep' " requires package ripgrep
Plug 'vifm/vifm.vim' " + requires package vifm

" Code completion
Plug 'prabirshrestha/asyncomplete.vim' " Completion engine. Sources/language servers are installed separately.
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Another completion engine

" Python
Plug 'https://github.com/davidhalter/jedi-vim.git' " Auto-completion library for python 

" Ansible
Plug 'pearofducks/ansible-vim' " Syntax highlighting
Plug 'yaegassy/coc-ansible', {'do': 'yarn install --frozen-lockfile'} " Requires ansible, ansible-lint, and optionally yamllint to be installed
"Or run :CocInstall @yaegassy/coc-ansible"

" C#
Plug 'OmniSharp/omnisharp-vim' " C# IDE features
Plug 'yami-beta/asyncomplete-omni.vim' " C# completion source for asyncomplete.vim

Plug 'https://github.com/ctrlpvim/ctrlp.vim.git' " Ctrl-p fuzzy search

"Plug 'dense-analysis/ale'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'andreypopp/asyncomplete-ale.vim'


" ------ Design/Visual ------

Plug 'vim-airline/vim-airline'

" Themes
Plug 'gilgigilgil/anderson.vim' " colorscheme 'anderson'
Plug 'danilo-augusto/vim-afterglow' " colorscheme 'afterglow'
Plug 'tomasiser/vim-code-dark' "colorscheme 'codedark'

call plug#end()


" ----------------------------------------------------
"                   General
" ----------------------------------------------------

source $VIMRUNTIME/defaults.vim


syntax on
filetype indent plugin on
set number
set wildmenu
set path+=** " So that you can fuzzy search filenames with 'find *substring'
set ignorecase

set foldmethod=indent
set foldlevel=99

" Remove bad/trailing whitespace  
autocmd BufWritePre *.py %s/\s\+$//e
autocmd BufWritePre *.yml %s/\s\+$//e
autocmd BufWritePre *.yaml %s/\s\+$//e



" ----------------------------------------------------
"                   Python
" ----------------------------------------------------
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix encoding=utf-8

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif


" ----------------------------------------------------
"                   Ansible
" ----------------------------------------------------

autocmd FileType yaml setlocal ai ts=2 sw=2 et

au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible " Syntax highlighting will apply to every file that matches */playbooks/*.yml

let g:coc_filetype_map = {
  \ 'yaml.ansible': 'ansible',
  \ }


" ----------------------------------------------------
"                   Remapping
" ----------------------------------------------------

nnoremap FF :CtrlP<cr>                          " Fuzzy search with CtrlP plugin
nnoremap <Leader>f :find<Space>*
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <Leader>g :vert Git<CR>
nnoremap <Leader>r :Rg<Space>
nnoremap <Leader>e :Explore<CR>
" nnoremap <Leader>e :vert Vifm<CR>
nnoremap <Leader>s :Vexplore<CR>
" nnoremap <Leader>s :VsplitVifm<CR>

" Auto-close quotes and brackets etc. Use Ctrl-v or Ctrl-q to escape this if
" you only need one quote or bracket.
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O




" ----------------------------------------------------
"                   Other
" ----------------------------------------------------

"let g:ale_linters = { 'cs': ['OmniSharp'] }

""autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
""\ 'name': 'omni',
""\ 'allowlist': ['*'],
""\ 'blocklist': ['c', 'cpp', 'html'],
""\ 'completor': function('asyncomplete#sources#omni#completor'),
""\ 'config': {
""\   'show_source_kind': 1,
""\ },
""\ }))
""
""au User asyncomplete_setup call asyncomplete#ale#register_source({
""    \ 'name': 'reason',
""    \ 'linter': 'flow',
""    \ })
""
""let g:lsp_settings = {}
""let g:lsp_settings.godot = { 'tcp': '127.0.0.1:6005'}



""highlight Normal ctermfg=white ctermbg=black




" ----------------------------------------------------
"                   Visuals
" ----------------------------------------------------
let currScheme = "codedark"

"colorscheme afterglow
execute "colorscheme " . currScheme

execute "let g:airline_theme='" . currScheme . "'"
let g:afterglow_italic_comments=1
"let g:afterglow_blackout=1
let g:afterglow_inherit_background=1




" To install colorschemes for vifm:
" 1. Find one you like here: https://vifm.info/colorschemes.shtml
" 2. Run 'wget -P ~/.vifm/colors https://raw.githubusercontent.com/vifm/vifm-colors/master/onedark.vifm'
" 3. Run 'echo "colorscheme onedark" >> ~/.config/vifm/vifmrc'


