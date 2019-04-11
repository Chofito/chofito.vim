" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround' 
Plug 'joshdick/onedark.vim' " Tema inspirado en Atom
Plug 'scrooloose/nerdtree' " Explorador de archivos
Plug 'vim-airline/vim-airline' " Barra de estado para Vim
Plug 'vim-airline/vim-airline-themes'  " Temas para airline
Plug 'Yggdroot/indentLine' " Mostrar indentaciones
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'  " Fuente general de auto completado
Plug 'ervandew/supertab' " Navegar entre las sugerencias de deoplete
Plug 'Shougo/echodoc.vim' " Muestra los parametros de la funcion
Plug 'sirver/ultisnips' 
Plug 'honza/vim-snippets' " Provee snippets (plantillas de codigo reusable)
Plug 'w0rp/ale' " Analizador estatico asincrono de codigo 
Plug 'sheerun/vim-polyglot' " Permite resaltar la sintaxis de un gran numero de lenguajes

call plug#end()


" Configuraciones
set number
set title  " Muestra el nombre del archivo en la ventana de la terminal
set number  " Muestra los números de las líneas
set mouse=a  " Permite la integración del mouse (seleccionar texto, mover el cursor)

set nowrap  " No dividir la línea si es muy larga

set cursorline  " Resalta la línea actual
set colorcolumn=120  " Muestra la columna límite a 120 caracteres

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
set background=dark  " Fondo del tema: light o dark
colorscheme onedark

let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
let g:indentLine_char_list = ['|', '¦', '┆', '┊'] " Diferentes caracteres para indentaciones
" No mostrar en ciertos tipos de buffers y archivos
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

" Activar deoplete al iniciar Neovim
let g:deoplete#enable_at_startup = 1

" Cerrar automaticamente la ventana de vista previa (donde se muestra documentación, si existe)
augroup deopleteCompleteDoneAu
  autocmd!
  autocmd CompleteDone * silent! pclose!
augroup END

" Invertir direccion de navegacion (de arriba a abajo)
let g:SuperTabDefaultCompletionType = '<c-n>'

" Activar echodoc al iniciar Neovim
let g:echodoc_enable_at_startup = 1

" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1

" Expandir snippet con Ctrl + j
let g:UltiSnipsExpandTrigger = '<c-j>'

" Ir a siguiente ubicacion con Ctrl + j
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
" Ir a anterior ubicacion con Ctrl + k
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" Mostrar mejor mensajes de error
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)

" Atajos varios

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
