""" General
set nocp                  " not compatible with the old vi
set encoding=utf-8
set fileencoding=utf-8
set noerrorbells
set nu                    " set line numbers
set history=50            " 50 last cmd in history
set background=dark
set autoread              " automatically reload modified files
set clipboard=autoselect  " selected text goes to clipboard

""" Indentation
set autoindent            " indent refering to the previous line
set smartindent
set cindent
set tabstop=4             " \t char width
set shiftwidth=4          " auto indent width
set softtabstop=4         " tabs indent width
set smarttab

""" Syntax
syntax on
set showmatch             " show matching brakets

""" Show current line (little hack)
set cursorline
autocmd insertLeave * set nocursorline
autocmd insertEnter * set cursorline
highlight CursorLine cterm=none ctermbg=Blue

""" Cmd bar auto-completion
set wmnu
set wildmode=list:longest,full

""" Commands
command RmSp :%s/\s\+$//e " Remove spaces at end of lines
command FR   :set spell spelllang=fr
command EN   :set spell spelllang=en

""" Functions
" Setup fcts redo the cfg for specific file/lang
function SetupTex()
  set textwidth=80
  set wrap
endfunction

""" Some fixs
au BufRead,BufNewFile *.aidl set filetype=java
au BufRead,BufNewFile *.nxc set filetype=c
autocmd FileType latex,tex :call SetupTex()
"if match(expand("%:p"), "linux") != -1
"  call SetupTabs()
"endif

""" Search
set hlsearch
set incsearch             " instant search
set wrapscan              " if no matches, restart at the top
set ignorecase
set smartcase             " Override ignorecase if an uppercase char is supplied

""" Keymaps
map <F4> :set nopaste <CR>
map <F5> :tabprevious <CR>
map <F6> :tabnext <CR>
map <silent> <F7> :execute 'silent! tabmove ' . (tabpagenr()-2) <CR>
map <silent> <F8> :execute 'silent! tabmove ' . tabpagenr() <CR>
map <F9> :tabnew <CR>
nnoremap <F3> :NERDTreeToggle<cr>

" Pathogen
execute pathogen#infect()
