" Tony Custom Vim
set nocompatible
filetype off

" We use Vundle manager
set rtp+=/Users/tony/opt/neovim/bundle/Vundle.vim

" Plugin defines here
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'itchyny/vim-gitbranch'
Plugin 'itchyny/lightline.vim'
Plugin 'preservim/nerdtree'
Plugin 'dense-analysis/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'trusktr/seti.vim'
Plugin 'orenhe/pylint.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}


"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'lervag/vimtex'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'bluz71/vim-nightfly-guicolors'
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'davidhalter/jedi-vim'

call vundle#end()


filetype plugin indent on

" set Itchyny on
set laststatus=2

let g:lightline = {
			\ 'colorscheme': 'wombat',
      			\ 'active': {
      			\   'left': [ [ 'mode', 'paste' ],
      			\             [ 'filename', 'gitbranch', 'readonly', 'modified' ] ],
      			\   'right': [ [ 'lineinfo' ],
      			\              [ 'percent' ],
      			\              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
			\ },
      			\ 'component_function': {
      			\   'gitbranch': 'FugitiveHead'
      			\ },
			\}

set completeopt-=preview


"let g:jedi#auto_initialization = 0
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#use_splits_not_buffers = "left"
"let g:jedi#show_call_signatures = "0"
"let g:jedi#popup_on_dot = 0
set backspace=indent,eol,start

syntax on
"set cursorcolumn
"set cursorline