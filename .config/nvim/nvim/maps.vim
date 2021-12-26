" Keybins
let g:mapleader = ' '  " Definir espacio como la tecla líder
nnoremap <leader>s :w<CR>  " Guardar con <líder> + s
nnoremap <leader>e :e $MYVIMRC<CR>  " Abrir el archivo init.vim con <líder> + e
" Usar <líder> + y para copiar al portapapeles
vnoremap <leader>y "+y
nnoremap <leader>y "+y
" Usar <líder> + d para cortar al portapapeles
vnoremap <leader>d "+d
nnoremap <leader>d "+d
" Usar <líder> + p para pegar desde el portapapeles
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P
" Moverse al buffer siguiente con <líder> + l
nnoremap <leader>l :bnext<CR>
" Moverse al buffer anterior con <líder> + j
nnoremap <leader>j :bprevious<CR>
" Cerrar el buffer actual con <líder> + q
nnoremap <leader>q :bdelete<CR>
"guardar un archivo
nmap <leader>w :w<CR>
"guardar y salir de un archivo
nmap <leader>wq :wq<CR>
" salir de NVIM
nmap <leader>x :q<CR>
nmap <leader>xx :q!<CR>
"recargar nvim 
nmap <leader>so :so%<CR>
"instalar plugins 
nmap <leader>pi :PlugInstall<CR>
"eliminar plugins 
nmap <leader>pc :PlugClean<CR>
" Float Term
nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
nnoremap   <silent>   <F4>    :FloatermKill<CR>
tnoremap   <silent>   <F4>    <C-\><C-n>:FloatermKill<CR>

" it also forces us to use the default Vim movement keys HJKL
" nnoremap <Left> :vertical resize -5<CR>
" nnoremap <Right> :vertical resize +5<CR>
" nnoremap <Up> :resize -5<CR>
" nnoremap <Down> :resize +5<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Go to last active tab

au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
