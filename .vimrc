syntax on
set encoding=utf-8
filetype plugin indent on
set backspace=indent,eol,start
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4

set shiftwidth=4

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

set autoindent
set number
set linebreak

let g:airline_theme='deus'

let g:ycm_extra_conf_globlist = ['~/dev/*','!~/*']

au filetype go inoremap <buffer> . .<C-x><C-o>
let g:Powerline_symbols='unicode'

let g:rustfmt_autosave = 1
