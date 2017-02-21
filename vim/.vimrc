" Zack Kismarton                |
" .vimrc v0.10                  |
" Tue Mar 18 15:59:10 EDT 2014  |
"                               |
" Changelog:                    |
" Moved bundles to vimrc.bundles|
" Re-organized!                 |
" Solarized colorscheme         |
" Switched pathogen for vundle  |
" Turned off relative number    |
" Adding binding to show        |
" Invisibles                    |
" Fixed compile binding         |
" ------------------------------

" Don't support Vi
set nocompatible
syntax enable

" Vundle Config
filetype on
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
  " source ~/.vimrc.bundles.local
endif

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

" Settings
" ========================================

if has("unix")
    set wildmenu " Make the command-line completion better
    set wildmode=longest,list,full " Autocompletion menu
    set wildignorecase " Make it easier to complete buffers, open files, etc...
    " Inserts the date below the cursor
    nmap <F8> :r!date<Cr>
    " Run the current file in the shell
    nmap <A-F9> :!%:p:r<CR> 
endif

set clipboard=unnamed " Sets '+' to be the be the copy to clipboard register. +y, +dd, etc.
set listchars=tab:▸\ ,eol:¬ " Use the same symbols as TextMate for tabstops and EOLs
set shellslash " set the forward slash to be the slash of note. Backslashes suck
set history=100 " Expand the history
set timeoutlen=500 " Sets timeout length
set noeb vb t_vb= " Turn off visual or audio bell
set wrapscan " Let search wrap around document
set hlsearch " Enable search highlighting
set ignorecase " Set the search scan so that it ignores case when the search is all lower case but recognizes uppercase if it's specified
set scrolloff=8 " Keep cursor 8 lines from the top or bottom
set virtualedit=all " Allow cursor movement through empty space
set synmaxcol=2048 " Set max columns
set showmode " Shows what mode I am currently in
set fillchars = "" " get rid of the silly characters in separators
set showfulltag " When completing by tag, show the whole tag, not just the function name
set pumheight=15 " Limit popup menu height
set number " Show line numbers
set bs=2 " Allow backspacing over indent, eol and start of insert
set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:- " These things start comment lines
set guioptions=acg " Turn off annoying gui options
set tw=110 " Textwidth
set splitbelow
set splitright
set hidden
set incsearch
set smartcase
set cpoptions=cesB$
set complete=.,w,i,b,t
set nobackup
set noswapfile
set fileformat=unix
set fileformats=unix,dos
set fo=cqt
set wm=0
set showcmd
set ls=2
" Tabstops are 4 spaces, replace tabs with spaces.
set ts=4
set sts=4
set sw=4
set expandtab
set autoindent
set smartindent
set copyindent
set nowrap " Default to nowrap
set autoread " Auto reload files edited outside of vim
set tags=~/.vimtags
" set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B] " statusline options
set t_Co=256
set background=dark
colorscheme solarized

" Binds
" ========================================
let mapleader = ","
let g:maplocalleader = ';'
nnoremap <silent> <leader>] :TagbarToggle<CR>
nnoremap <silent> <leader>d :call pdv#DocumentWithSnip()<CR>
map <leader>l :Align
nmap <leader>a :Ag<space>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
nnoremap <silent> <leader>kb :NERDTreeToggle<CR>
noremap <silent> ,bd :BD<CR>
nnoremap <F9> :GundoToggle<CR>
omap <silent> <leader>/ :Align => = \* /<CR>
vmap <silent> <leader>/ :Align => = \* /<CR>
omap <silent> // :TCommentBlock<CR>
vmap <silent> // :TCommentBlock<CR>
nmap <silent> // :TComment<CR>

imap jj <esc> "Map escape key to jj -- much faster
nmap <leader>l :set list!<CR> " Toggle `set list` " Toggle invis characters
nmap <silent> ,ww :set invwrap<CR>:set wrap?<CR> " Toggle text wrapping
nmap <silent> ,p :set invpaste<CR>:set paste?<CR> " Toggle paste mode
cmap w!! w !sudo tee % >/dev/null<CR> " For when you forget to sudo..
nmap <silent> ,ev :e $MYVIMRC<CR> " Edit my vimrc file
nmap <silent> ,sv :so $MYVIMRC<CR> " Source my vimrc
nmap <silent> ,cd :lcd %:h<CR> " cd to the directory containing the file in the buffer
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> " Use space to remove annoying search highlighting
map <c-s> :w<CR> " Map Ctrl-S to save
" Make the directory that contains the file in the current buffer.
nmap <silent> ,md :!mkdir %:p:h<CR>
" Lower my blood pressure
nmap <silent>:W :w
nmap <silent>:Q :q
nmap <silent>Y y$
" easier window navigation
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
" Make horizontal scrolling easier
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh
" Save time parsing through buffers
nmap ,bn :bn<CR>
nmap ,bv :bp<CR>
" returns the syntax highlighting group that the current "thing" under the cursor belongs to
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" Dump coulmn names from <table>
" @todo make into function that takes table name param
" nmap <c-t> :r!mysql -uroot -p -e 'SELECT DISTINCT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = "users_residents_pg"'<Cr>

" Fix ultisnips jump backwards trigger
inoremap <c-x><c-k> <c-x><c-k>

" Plugin settings
" ========================================
let g:Powerline_symbols = 'fancy'
let NERDTreeShowBookmarks=1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:5,results:10'
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
let g:acp_enableAtStartup = 0
" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_enable_smart_case = 1
" let g:neocomplcache_min_syntax_length = 3
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:syntastic_php_checkers = ['php']
" let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:mustache_abbreviations = 1
let g:UltiSnipsExpandTrigger="<c-l>"
" let g:UltiSnipsJumpForwardTrigger="<c-l>"
" let g:UltiSnipsJumpBackwardTrigger="<c-h>"

let g:vdebug_options= {
\    "port" : 9009,
\    "server" : '',
\    "break_on_open" : 1,
\    "ide_key" : '',
\    "path_maps" : {"/home/vagrant/manulith.com": "/Users/zack/Sites/makeros"},
\}

let g:easytags_async = 1
let g:easytags_auto_highlight = 0

" Ag - Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use Ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Misc
" ======================================

" Helpeful abbreviations
iab lorem lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

if has("autocmd")
    au VimResized * :wincmd =

    " Language syntax fixes
    au BufRead,BufNewFile *.md set filetype=markdown
    au BufRead,BufNewFile *.md set spell
    au BufRead,BufNewFile *.mh set filetype=php
    au FileType javascript,css,php nmap <silent> <leader>; :call cosco#commaOrSemiColon()<CR>
    au FileType javascript,css,php inoremap <silent> <leader>; <ESC>:call cosco#commaOrSemiColon()"<CR>a
    au FileType php setlocal ts=3 sts=3 sw=3 noexpandtab
    au FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    " au FileType cpp nmap <C-F9> :!clang -x c++ -arch x86_64 -std=gnu++11 -stdlib=libc++ -o %:r %<CR>
    " au FileType cpp nmap <C-F9> :!g++ -o %:r %<CR>
    " au FileType c nmap <C-F9> :!gcc -std=c99 -o %:r %<CR>
endif

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX') " Support resizing in tmux
  set ttymouse=xterm2
endif

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
