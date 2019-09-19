" General
set relativenumber number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set textwidth=140	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
"set spell	" Enable spell-checking
set visualbell	" Use visual bell (no beeping)
syntax on 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
 
"" Advanced
set confirm	" Prompt confirmation dialogs
set ruler	" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
 
set clipboard=unnamedplus
"" Generated by VimConfig.com

"Wrap lines at beginng/end
set whichwrap+=<,>,h,l,[,]

"Silent command for displaying output without Enter
command! -nargs=1 Silent
\   execute 'silent !' . <q-args>
\ | execute 'redraw!'

let g:rehash256 = 1
let g:Powerline_symbols='unicode'
let g:Powerline_theme='long'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='angr'

"Autocommands
:augroup Xresources
: autocmd!
: autocmd BufWritePost .Xresources :Silent xrdb %:p
:augroup END

"Maps
noremap x "_x
imap jj <Esc>

