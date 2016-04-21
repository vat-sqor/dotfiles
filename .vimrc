set fenc=utf-8 "utf-8
set termencoding=utf-8
scriptencoding utf-8
set ambiwidth=double
set nocompatible
set spell spelllang=en_us
set spellfile="~/.vim/spellfile"
set nospell
let s:running_windows = has("was16") || has("win32") || has("win64")
let s:colorful_term= (&term =~ "xterm" ) || (&term =~ "screen")
set cpoptions=aABceFsmq
            " |||||||||
            " ||||||||+-- When joining lines, leave the cursor between joined lines
            " |||||||+-- When a new match is created (showmatch) pause for .5
            " ||||||+-- Set buffer options when entering the buffer
            " |||||+-- :write command updates current file name automatically add <CR> to the last line when using :@r
            " |||+-- Searching continues at the end of the match at the cursor position
            " ||+-- A backslash has no special meaning in mappings
            " |+-- :write updates alternative file name
            " +-- :read updates alternative file name
"TODO
set viminfo+=! " make sure it can save viminfo
"set viminfo++!n~/.vim/viminfo
set iskeyword+=_,$,@,%,#,- " none of these should be word dividers, so make them not be

call plug#begin('~/.vim/bundle')
    Plug 'godlygeek/tabular'
    Plug 'spiiph/vim-space'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-ragtag'
    Plug 'tpope/vim-abolish'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/syntastic'
    Plug 'Shougo/vimproc'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'vim-scripts/javacomplete', { 'for' : 'java' }
    Plug 'jiangmiao/auto-pairs'
    "Plug 'FSwitch' #only useful for c/c++
    Plug 'jlanzarotta/bufexplorer'
    Plug 'c9s/perlomni.vim', { 'for': 'perl' }
    Plug 'vim-perl/vim-perl', { 'for': 'perl' }
    "Plug 'Rip-Rip/clang_complete', { 'for': ['c++', 'c'] }
    Plug 'tehmaze/profont-powerline'
    Plug 'tmhedberg/matchit'
    Plug 'vim-scripts/python_match.vim', { 'for': 'python' }
    Plug 'semmons99/vim-ruby-matchit', { 'for': 'ruby' }
    Plug 'tysontate/HTML-AutoCloseTag', { 'for': ['html', 'xml', 'xhtml'] }
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'chreekat/vim-paren-crosshairs'
    Plug 'tpope/vim-fugitive'
    Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
    Plug 'kien/ctrlp.vim'
    Plug 'mbbill/undotree'
    Plug 'luochen1990/rainbow'
    Plug 'bling/vim-bufferline'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-scripts/VisIncr'
    Plug 'edkolev/erlang-motions.vim', { 'for': 'erlang' }
    Plug 'hcs42/vim-erlang-runtime', { 'for': 'erlang' }
    Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
    Plug 'neitanod/vim-clevertab'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
call plug#end()

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers=['standard', 'eslint']

filetype on " detect the type of file
filetype plugin on " load filetype plugins
filetype plugin indent on
colorscheme machinshin " my theme
"show the current command in progress
set showcmd
set autowriteall
" set to autoread when a file is changed from teh outside
set autoread
set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
set history=5000 " How many lines of history to remember
set cf " enable error files and error jumping
set clipboard+=unnamed "share windows clipboard
set ffs=unix,mac,dos "support all three, in this order

" Files/Backups
set backup " make backup file
if s:running_windows
  set backupdir=~/vimfiles/backup " where to put backup file
  set undodir=~/vimfiles/undo
  set directory=~/vimfiles/temp " directory is the directory for temp file
else
  set backupdir=~/.vim/backup " where to put backup file
  set undodir=~/.vim/undo
  set directory=~/.vim/temp " directory is the directory for temp file
endif
set undolevels=1000
set undoreload=10000

set updatetime=180 "save to swap file after 3 minutes
set makeef=error.err " When using make, where should it dump the file
set lsp=0 " space it out a little more (easier to read)
"first tab: longest match. list in the statusbar, follow tabs: cycle through matches
set wildmenu
set wildmode=longest:full,full
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.so.*,*.jpg,*.gif,*.png
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.DS_Store,*.tgz,*.gz
set ruler " Always show current positions along the bottom
"set cmdheight=2 " the command bar is 2 high
set relativenumber
set number " turn on line numbers
set hid " you can change buffer without saving
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,b,s,[,],~  " backspace and cursor keys wrap to
             " | | | | | | | | |
             " | | | | | | | | +-- "]" Insert and Replace
             " | | | | | | | +-- "[" Insert and Replace
             " | | | | | | +-- "~" Normal
             " | | | | | +-- <Right> Normal and Visual
             " | | | | +-- <Left> Normal and Visual
             " | | | +-- "l" Normal and Visual (not recommended)
             " | | +-- "h" Normal and Visual (not recommended)
             " | +-- <Space> Normal and Visual
             " +-- <BS> Normal and Visual

set mouse=a " use mouse everywhere
set linespace=0
set sidescroll=10
set sidescrolloff=10
set shortmess=filmnrwxsWI
             "||||||||||+-- I Don't give the intro message when starting Vim |:intro|.
             "|||||||||+-- W Don't give "written" or "[w]" when writing a file
             "||||||||+-- s Don't give "search hit BOTTOM, continuing at TOP" or "search hit TOP, continuing at BOTTOM" messages
             "|||||||+-- x use "[dos]" instead of "[dos format]", etc
             "||||||+-- w use [w] instead of 'written', etc
             "|||||+-- r  use [RO] instaed of [readonly]
             "||||+-- n use "[New]" instead of "[New File]"
             "|||+-- m use "[+]" instead of "[Modified]"
             "||+-- l use "999L, 888C" instead of "999 lines, 888 characters"
             "|+-- i use "[noeol]" instead of "[Incomplete last line]"
             "+-- f	use "(3 of 5)" instead of "(file 3 of 5)"

set report=0 " tell us when anything is changed via :...
set noerrorbells " don't make noise
" make the splitters between windows be blank
set fillchars=vert:\ ,stl:\ ,stlnc:\
" Visual Cues
set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for
set hlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
set formatoptions=rq
"only show listchars in insert mode
if has("multi_byte")
  set listchars=tab:⋯\ ,eol:⋮,trail:⋅,extends:⧽,precedes:⧼ " what to show when I hit :set listchars
  "  let g:tagbar_iconchars = ['▾', '▸']
else
  set listchars=tab:\|\ ,eol:$,trail:.,extends:>,precedes:< " what to show when I hit :set list
  "let g:tagbar_iconchars = ['+', '-']  (default on Windows)
end

set list " turns out, I like listchars -- show chars on end of line, whitespace, etc
"set columns=160 " 160 cols wide
"set so=10 " Keep 10 lines (top/bottom) for scope
set novisualbell " don't blink
set laststatus=2 " always show the status line
" Text Formatting/Layout
set fo=tcrqn " See Help (complex)
set autoindent
set smartindent
set cindent " do c-style indenting
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify
set expandtab " real tabs please!
set nowrap " do not wrap lines
set smarttab " use tabs at the start of a line, spaces elsewhere
"map <Esc> to jj,thus ea
imap jj <ESC>
" remap Leader key to comma
let g:maplocalleader='\\'
let g:mapleader=','
" keep selection on indenting in visual mode
vnoremap < <gv
vnoremap > >gv
" map page-up and page-down to ctrl-k & ctrl-j respectively
noremap <S-k> <C-u>
noremap <S-j> <C-d>

" Custom Functions

"turn off *ALL* bells
set visualbell t_vb=
set omnifunc=syntaxcomplete#Complete
augroup complete
    autocmd!
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
    autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    inoremap <silent><tab> <c-r>=CleverTab#Complete('start')<cr>
        \ <c-r>=CleverTab#Complete('tab')<cr>
        \ <c-r>=CleverTab#Complete('keyword')<cr>
        \ <c-r>=CleverTab#Complete('omni')<cr>
        " \ <c-r>=CleverTab#Complete('neocomplete')<cr>
        " \ <c-r>=CleverTab#Complete('neosnippet')<cr>
        \ <c-r>=CleverTab#Complete('stop')<cr>
    inoremap <silent><s-tab> <c-r>=CleverTab#Complete('prev')<cr>
augroup END

augroup cursor
    autocmd!
" Restore cursor position
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
augroup END

"disable autoindent before pasting.
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

function! PasterToggle()
  let w:check_paste_status =exists('w:check_paste_status') ? !w:check_paste_status : 1
  "call QuickfixsignsToggle()
  if( w:check_paste_status)
    execute 'set mouse='
    execute 'set foldcolumn=0'
    execute 'set nolist'
    execute 'set norelativenumber'
    execute 'set nonumber'
  else
    execute 'set mouse=a'
    execute 'set foldcolumn=1'
    execute 'set list'
    execute 'set relativenumber'
    execute 'set number'
  endif
endfunction
nnoremap <silent><Leader>2 :call PasterToggle()<CR>

function! DoChighlight()
  let w:check_highlight_status =exists('w:check_highlight_status ') ? !w:check_highlight_status : 1
  if( w:check_highlight_status )
    execute 'syntax on'
    execute 'colorscheme machinshin'
  else
    execute 'syntax off'
  endif
endfunc
syntax on
nnoremap <silent><Leader>3 :call DoChighlight()<CR>
"quicksave
nmap <Leader>s :w!<cr>
"fast edit of vimrc
map <silent> <Leader>v :e! ~/.vimrc<cr>
map <silent> <Leader><Leader>c :set cursorcolumn!<cr> :set cursorline!<cr>

function! g:ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=100
  endif
endfunction
set colorcolumn=100
noremap <silent><LocalLeader>cl :call g:ToggleColorColumn()<CR>

"Window movement/management
" go up a window
nnoremap <Leader>t <C-w>k
" go down a window
nnoremap <Leader>b <C-w>j
" go left a window
nnoremap <Leader>h <C-w>h
" go right a window
nnoremap <Leader>l <C-w>l
" new window on top
nnoremap <Leader>n <C-w>n
" quit window
nnoremap <Leader>q <C-w>q
" quit all windows & shutdown vim
nnoremap <silent><Leader><Leader>q <ESC>:xa<CR>
"rotate windows to the bottom/right
nnoremap <Leader><Leader>r <C-w>r
"rotate windows to the top/left
nnoremap <Leader><Leader>R <C-w>r
"make only window
nnoremap <Leader><Leader>o <C-w>o
" move current window to far left
nnoremap <Leader><Leader>h <C-W>H
" move current window to far right
nnoremap <Leader><Leader>l <C-W>L
" move current window to top, not j/k cause i hit ,, (then j/k) too often, and fuck things up
nnoremap <Leader><Leader>t <C-W>K
" move current window to bottom
nnoremap <Leader><Leader>b <C-W>J
nnoremap j gj
nnoremap k gk


" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] to customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" Default fzf layout
" - down / up / left / right
" - window (nvim only)
let g:fzf_layout = { 'up': '~30%' }
"show at top
let g:ctrlp_match_window_bottom=0
" Tell Ctrl-P to keep the current VIM working directory when starting a
" search, another really stupid non default
"let g:ctrlp_working_path_mode = 0
" Ctrl-P ignore target dirs so VIM doesn't have to!
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.git|log(s)*|node_modules|build|ebin|_rel|deps)',
      \ 'file': '\v\.(exe|so|dll|tgz|gz|beam)$',
      \ }
let g:ctrlp_match_window_reverse=0
let g:ctrlp_open_multi = 'i'
let g:ctrlp_match_window_reverse=0
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_switch_buffer='Et'
let g:ctrlp_extensions=['mixed']
let g:ctrlp_map='<Leader><Leader>'

nnoremap <F3> :UndoTree<CR>

" Window resizing mappings
nnoremap <silent> <S-Up> :<c-u>exe "resize " . (winheight(0) + 5)<cr>
nnoremap <silent> <S-Down> :<c-u>exe "resize " . (winheight(0) - 5)<cr>
nnoremap <silent> <S-Left> :<c-u>exe "vertical resize " . (winwidth(0) - 5)<cr>
nnoremap <silent> <S-Right> :<c-u>exe "vertical resize " . (winwidth(0) + 5)<cr>

set foldenable
set foldopen=block,hor,mark,percent,quickfix ",tag "what movements open folds"
function! HasFoldedLine()
    let lnum=1
    while lnum <= line("$")
        if (foldclosed(lnum) > -1)
            return 1
        endif
        let lnum+=1
    endwhile
    return 0
endfunction

autocmd CursorHold * if HasFoldedLine() == 1 | set foldcolumn=1 | else |set foldcolumn=0 | endif

"maps for foldng
" close all open folds
nnoremap <Leader>f zM<cr>
" open all closed folds
nnoremap <Leader>F zR<cr>

" remember folding state
autocmd BufWinLeave ?* silent mkview
autocmd BufWinEnter ?* silent loadview

"clear hlsearch results by typing ,,c
nnoremap <silent> <Leader><Leader>cs :nohlsearch<CR>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap <Space> ]czzzv
nnoremap <S-Space> [czzzv
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap m ]czzzv
nnoremap M [czzzv
nnoremap <Leader>o do<CR>
nnoremap <Leader>P dp<CR>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" jump to start & end of line using home-row keys
map H ^
map L $
" tabbing selected section
"map Q to last recorded macro
map Q @@
nnoremap <silent>.n :n<cr>
nnoremap <silent>.p :N<cr>
nnoremap <silent><Leader><Leader>q :qa<CR>
nnoremap / /\v
vnoremap / /\v
set gdefault
"make traversing help docs easier
nnoremap <buffer> <CR> <C-]>
nnoremap <buffer> <BS> <C-T>
nnoremap <buffer> o /'\l\{2,\}'<CR>
nnoremap <buffer> O ?'\l\{2,\}'<CR>
nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
inoremap nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
inoremap nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>

" visually select everything between 2 %'s'
noremap <Leader>% v%
"scroll screen on brace highlight

" Y to end of line
nnoremap Y y$

nnoremap <silent><Leader>~ :set tildeop!<CR>
let g:ragtag_global_maps = 1

if &diff
else
    "autocmd VimEnter * nested :call tagbar#autoopen(1)
    nnoremap <silent><Leader>of :.Gbrowse! @upstream<CR>
endif
"set shell=zsh

autocmd BufNewFile,BufRead *.tt setf tt2
autocmd BufNewFile,BufRead *.tt2 setf tt2

if $TMUX == ''
  set clipboard+=unnamed
endif
set tags=tags;
"highlight trailing whitespace in vim on non empty lines, but not while typing in insert mode!
augroup whitespace
    autocmd!
    highlight ExtraWhitespace ctermbg=red guibg=Brown
    autocmd ColorScheme * highlight ExtraWhitespace guibg=red
    autocmd BufEnter * match ExtraWhitespace /\S\zs\s\+$/
augroup END


" lets you do w!! to sudo write the file
set statusline +=%F
nnoremap <Leader>ww :w !sudo tee % >/dev/null<cr>
" Delete all trailing spaces from lines but keep search buffer in place
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
"delete whitespace
nnoremap <Leader><Leader>dw :call Preserve("%s/\\s\\+$//e")<CR>
"autoindent whole
nnoremap <Leader><Leader>i  :call Preserve("normal gg=G")<CR>

autocmd BufNewFile,BufRead *.yml set filetype=yaml
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#branch#format = 1
let g:airline_powerline_fonts=1
let g:airline_theme='distinguished'
let g:airline#extensions#syntastic#enabled = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

let g:airline#extensions#tagbar#enabled = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_iminsert=1
let g:bufferline_echo=0

" Visual ack, used to ack for highlighted text
function! s:VAck()
  let old = @"
  norm! gvy
  let @z = substitute(escape(@", '\'), '\n', '\\n', 'g')
  let @" = old
endfunction

" Ack for visual selection
vnoremap <Leader>av :<C-u>call <SID>VAck()<CR>:exe "Ack! ".@z.""<CR>
" Ack for word under cursor
nnoremap <Leader>av :Ack!<cr>
" Open Ack
nnoremap <Leader>ao :Ack! -i

"https://gist.github.com/andyfowler/1195581
" set a nicer cursor in insert mode (from terryma on github)
" Tmux will only forward escape sequences to the terminal if surrounded by
" a DCS sequence
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" make space execute the 'r' macro (press qr to start recording, q to stop,
" then [space] to execute.  super convenient)
noremap <Space> @r

set foldcolumn=1
noremap <silent><Leader><Leader>j :%!jq '.'<CR>

set noscrollbind
set nocursorbind

" Yank text to the OS X clipboard
noremap <Leader>y "*y
noremap <Leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <Leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

augroup nospell
    autocmd!
    autocmd   FileType   help     setlocal   nospell
    autocmd   FileType   yaml     setlocal   nospell
    autocmd   FileType   yml      setlocal   nospell
    autocmd   FileType   python   setlocal   nospell
    autocmd   FileType   sh       setlocal   nospell
    autocmd   FileType   erlang   setlocal   nospell
    autocmd   FileType   erlang   setlocal   nospell
    autocmd   FileType   yaml     setlocal   shiftwidth=2   tabstop=2   softtabstop=2   "   unify
    autocmd   FileType   config   setlocal   filetype erlang
    autocmd   FileType   sh       setlocal
augroup END

