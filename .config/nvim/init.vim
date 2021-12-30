so ~/.config/nvim/plugins.vim
so ~/.config/nvim/maps.vim
so ~/.config/nvim/plugins-config.vim

set title  " Muestra l nombre del archivo en la ventana de la terminal
set number  " Muestra los números de las líneas
set relativenumber " muestra el numero de linea RELATIVO
set noshowmode "no mostrar el modo en que estamos

set mouse=a  " Permite la integración del mouse (seleccionar texto, mover el cursor)

set wrap  " dividir la línea si es muy larga
set textwidth=80 " limite de linea" 

set cursorline  " Resalta la línea actual
set colorcolumn=80  " Muestra la columna límite a 120 caracteres

" Indentación a 2 espacios
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab  " Insertar espacios en lugar de <Tab>s

set hidden  " Permitir cambiar de buffers sin tener que guardarlos

set ignorecase  " Ignorar mayúsculas al hacer una búsqueda
set smartcase  " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas

set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español

set termguicolors  " Activa true colors en la terminal

"set nerdfont
set guifont=JetBrainsMono\ Nerd\ Font:h10
set encoding=utf-8

set clipboard=unnamedplus

colorscheme dracula

let g:clap_layout = { 'width': '70%', 'col': '15%', 'row': '10%', 'relative': 'editor' }

" sets php.vim version adherense
" let g:php_version_id = 70405

" does not load highlighting for HTML inside of PHP 
let g:php_html_load = 0
" config de emmet 
let g:user_emmet_expandabbr_key = '<c-e>'
let g:use_emmet_complete_tag = 1

" config MultiCursor
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
