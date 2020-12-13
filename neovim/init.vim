syntax enable
set termguicolors "true color support

if &compatible
  set nocompatible               " Be iMproved
endif

" nVim plugs
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

"GUI stuff
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'                          " give more information on the prompt

" auto completion, LSP
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'davidhalter/jedi-vim'
Plug 'desmap/ale-sensible'

" Distraction free writing
Plug 'junegunn/goyo.vim'

" Rust crates
Plug 'mhinz/vim-crates'

" Search
Plug 'junegunn/fzf.vim'                                 " fuzzy search integration
Plug 'scrooloose/nerdtree'                              " Shows file explorer

" GDB/LLDB integration
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

" visual
Plug 'Yggdroot/indentLine'                              " show indentation lines
Plug 'google/vim-searchindex'                           " add number of found matching search items

" other
Plug 'tpope/vim-commentary'                             " better commenting
Plug 'tpope/vim-sensible'                               " sensible defaults
Plug '907th/vim-auto-save'                              " auto save changes
Plug 'mhinz/vim-startify'                               " cool start up screen
Plug 'psliwka/vim-smoothie'                             " some very smooth ass scrolling
Plug 'easymotion/vim-easymotion'                        " make movement a lot faster and easier
Plug 'jiangmiao/auto-pairs'                             " automatic quote and bracket completion
Plug 'alvan/vim-closetag'                               " auto close html tags
Plug 'mhinz/vim-crates'                                 "

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" some configuration
set  runtimepath+=/usr/local/opt/fzf
set encoding=UTF-8
filetype plugin indent on                               " enable indentations
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent            " tab key actions
set incsearch ignorecase smartcase hlsearch             " highlight text while searching
set list listchars=trail:»,tab:»-                       " use tab to navigate in list mode
set fillchars+=vert:\▏                                  " requires a patched nerd font (try FiraCode)
set wrap breakindent                                    " wrap long lines to the width set by tw
set conceallevel=2                                      " set this so we wont break indentation plugin
set tw=80                                               " auto wrap lines that are longer than that
let g:indentLine_setConceal = 0                         " actually fix the annoying markdown links conversion
au BufEnter * set fo-=c fo-=r fo-=o                     " stop annoying auto commenting on new lines
set undofile                                            " enable persistent undo
set undodir=~/.nvim/tmp                                 " undo temp file directory
set nofoldenable                                        " disable folding

" Nvim python hacks with pyenv as macOS python3 is terrible.

let g:python_host_prog = '/Users/gebruiker/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/gebruiker/.pyenv/versions/neovim3/bin/python'

" Airline/theme stuff
let g:airline_theme='material'
let g:airline_powerline_fonts = 1

" Palenight
let g:material_style='palenight'
set background=dark
colorscheme vim-material

" Coloring

highlight Pmenu guibg='00010a' guifg=white              " popup menu colors
highlight Comment gui=bold                              " bold comments
highlight Normal gui=none
highlight NonText guibg=none
highlight clear SignColumn                              " use number color for sign column color
hi Search guibg=orange                                  " search string highlight color
autocmd ColorScheme * highlight VertSplit cterm=NONE    " split color
hi NonText guifg=bg                                     " mask ~ on empty lines
hi clear CursorLineNr                                   " use the theme color for relative number
hi CursorLineNr gui=bold                                " make relative number bold

" coc multi cursor highlight color
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2

" Ale
highlight ALEErrorSign ctermfg=9 ctermbg=15 guifg=#C30500
highlight ALEWarningSign ctermfg=11 ctermbg=15 guifg=#FFA500

" performance tweaks
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set synmaxcol=180
set re=1

" required by coc
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" tmux cursor shape
if exists('$TMUX')
    let &t_SI .= "\ePtmux;\e\e[=1c\e\\"
    let &t_EI .= "\ePtmux;\e\e[=2c\e\\"
 else
    let &t_SI .= "\e[=1c"
    let &t_EI .= "\e[=2c"
 endif

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

" startify
let g:startify_session_persistence = 1

" auto save file changes
let g:auto_save = 1                                     " enable AutoSave on Vim startup
let g:auto_save_no_updatetime = 1                       " do not change the 'updatetime' option
let g:auto_save_in_insert_mode = 0                      " do not save while in insert mode
let g:auto_save_silent = 1

" easymotion
let g:EasyMotion_startofline = 0                        " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1                          " ignore case

"" FZF

" general
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
let $FZF_DEFAULT_OPTS="--reverse " " top to bottom

" use rg by default
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" coc
" use tab for completion trigger
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" Use enter to accept snippet expansion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" list of the extensions required
let g:coc_global_extensions = [
            \'coc-json',
            \'coc-html',
            \'coc-yaml',
            \'coc-python',
            \'coc-rls',
            \'coc-syntax',
            \'coc-go',
            \]

" ALE
let g:ale_fixers = {
            \'*': ['remove_trailing_lines', 'trim_whitespace'],
            \'javascript': ['prettier'],
            \'c' : ['clang-format'],
            \'cpp' : ['clang-format'],
            \'css' : ['prettier'],
            \'html' : ['prettier'],
            \'markdown' : ['prettier'],
            \'yaml': ['prettier'],
            \'json': ['prettier'],
            \}
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '✘'
let g:ale_sign_info = ''

" ======================== Filetype-Specific Configurations ============================= "

" Markdown
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType markdown set spell
autocmd FileType markdown map <silent> <leader>m :call TerminalPreviewMarkdown()<CR>

" config files
au BufReadPost,BufNewFile */polybar/* set filetype=dosini

" startify when there is no buffer or args
autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif

" auto html tags closing, enable for markdown files as well
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.md'

" disable autosave on kernel directory and also formatting on save (we dont wanna fuck this up)
autocmd BufRead,BufNewFile */Dark-Ages/* let b:auto_save = 0
autocmd BufRead,BufNewFile */Dark-Ages/* let b:ale_fix_on_save = 0

" ================== Custom Functions ===================== "

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

" floating fzf window with borders
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

" Files + devicons + floating fzf
function! Fzf_dev()
  let l:fzf_files_options = '--preview "bat --line-range :'.&lines.' --theme="OneHalfDark" --style=numbers,changes --color always {2..-1}" --expect=ctrl-v,ctrl-x,ctrl-t'
  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

    function! s:edit_file(lines)
        if len(a:lines) < 2 | return | endif

        let l:cmd = get({'ctrl-x': 'split',
                         \ 'ctrl-v': 'vertical split',
                         \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')

        for l:item in a:lines[1:]
            let l:pos = stridx(l:item, ' ')
            let l:file_path = l:item[pos+1:-1]
            execute 'silent '. l:cmd . ' ' . l:file_path
        endfor
    endfunction

    call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink*':   function('s:edit_file'),
        \ 'options': '-m --reverse ' . l:fzf_files_options,
        \ 'down':    '40%',
        \ 'window': 'call CreateCenteredFloatingWindow()'})

endfunction

" Rust stuff for crates

if has('nvim')
  autocmd BufRead Cargo.toml call crates#toggle()
endif
