call plug#begin()
" VIM Monokai
Plug 'ErichDonGubler/vim-sublime-monokai'
" Barra de Estado Airline
Plug 'vim-airline/vim-airline' "barra de estado
Plug 'vim-airline/vim-airline-themes' "barra de estado
" CoC VIM
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Terminal Flotante
Plug 'voldikss/vim-floaterm'
" Dracula theme para Vim
Plug 'dracula/vim', { 'as': 'dracula' }
" makes vim autocomplete (), [], {}, '', "", etc
Plug 'jiangmiao/auto-pairs'
" see the git status of the current line in
" the gutter
Plug 'airblade/vim-gitgutter'
" plugins EMMET
Plug 'mattn/emmet-vim'
" plugins Phatogen
Plug 'tpope/vim-pathogen'
" plugin MySql
Plug 'ajavalera/mysql_plugin'
" Multi cursor en nvim
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

 
