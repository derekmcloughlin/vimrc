set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle "bufexplorer.zip"

Bundle 'wincent/Command-T'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mileszs/ack.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-vividchalk'
Bundle 'int3/vim-extradite'
Bundle 'vim-scripts/Quich-Filter'
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/actionscript.vim'
Bundle 'vim-scripts/python_match.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'gregsexton/gitv'
Bundle 'oscarh/vimerl'
Bundle 'vim-scripts/VimClojure'

set backupdir=~/tmp
set ignorecase 
set smartcase
set gdefault
set hidden
set nu
set ruler
set ls=2
set ai
set nowrap
set incsearch
set hlsearch
set showcmd
set showmatch
set history=1000
set wildmenu
set undofile

let mapleader = ","

" invisible list characters
map <leader>s :se list!<CR>
se listchars=tab:->,eol:$

" Tab Settings
se ts=4
se sw=4
se expandtab
se softtabstop=4

" Use normal regex handling
nnoremap / /\v
vnoremap / /\v

" Clear highlighed search results
nnoremap <leader><space> :noh<cr>

" Use TAB to match brackets
nnoremap <tab> %
vnoremap <tab> %

syntax on

"Command-T behaviour
let g:CommandTMatchWindowAtTop=1

if has("autocmd")
  autocmd BufNewFile,BufRead *.rb setlocal ts=2 sts=2 sw=2 noet
  autocmd BufNewFile,BufRead *.vb set ft=vbnet
  autocmd BufNewFile,BufRead *.hrl set ft=erlang
  autocmd BufNewFile,BufRead *.rsel set ft=ruby
  autocmd BufNewFile,BufRead *.json set ft=javascript
  autocmd BufRead,BufNewFile *.haml setfiletype haml 
  autocmd BufRead,BufNewFile *.org setfiletype org 
  autocmd BufRead,BufNewFile *.as set filetype=actionscript 
  autocmd BufRead,BufNewFile *.mxml set filetype=xml 
  autocmd BufRead,BufNewFile *.har set filetype=javascript 
endif

if has("win32")
    let Grep_Cygwin_Find = 1 
	let Grep_Path = 'c:\cygwin\bin\grep.exe' 
	let Grep_Find_Path = 'c:\cygwin\bin\find.exe' 
endif

" Settings for ACK
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Settings for fuzzy finder
let g:fuzzy_ignore = "vendor/*;public/*;"

nnoremap ' `
nnoremap ` '

" Console keyboard mappings (no ALT)
map <F9> <Esc>:Ack <cword><CR>
map <F10> <Esc>:FuzzyFinderTextMate<CR>
map <C-Tab> <Esc>:bnext!<CR>
map <C-S-Tab> <Esc>:bprevious!<CR>
map <F5> <Esc>:se guioptions=m<CR>
map <F12> <Esc>,be
map <C-Up> <C-y>
map <C-Down> <C-e>

" NERDTree options
let g:NERDShutUp = 1
let NERDTreeWinSize = 40
let NERDTreeIgnore=['\.pyc']

" VCS Options
let VCSCommandDeleteOnHide=1

colors default

" Django stuff
se path+=/Users/derek/work/championshipmanager/champman/champman/templates

"Clojure
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1

" Fugative
autocmd BufReadPost fugitive://* set bufhidden=delete
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Slience the bell
"set vb t_vb=

" Filtering key bindings
nnoremap ,F :call Gather(input("Filter on term: "), 0)<CR>
nnoremap ,f :call FilteringNew().addToParameter('alt', @/).run()<CR>
nnoremap ,g :call GotoOpenSearchBuffer()<CR>
nnoremap ,d :call CloseAllSearchWindows()<CR>

map <leader>l <Esc>:NERDTreeToggle<CR>
map <leader>k <Esc>:cclose<CR>
map <C-F4> <Esc>:tabclose<CR>
map <F8> <Esc>:cnext<CR>
map <S-F8> <Esc>:cprev<CR>

if has("gui_running")
    colors vividchalk
    if has("win32")
        se guifont=Consolas:h12:cANSI
	elseif has("gui_macvim")
        se guifont=Menlo\ Regular:h16
		set fuoptions=maxvert,maxhorz
    else
        se guifont=Consolas\ 12
    endif
    set clipboard+=unnamed " sharing windows clipboard

    let Tlist_Use_Right_Window = 1
    " actionscript language settings for taglist
    let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'
    let Tlist_Show_One_File = 1

    set guioptions=Me

    map <F2> <Esc>:TlistToggle<CR>
    map <A-left> <C-W>h
    map <A-right> <C-W>l
    map <A-up> <C-W>k
    map <A-down> <C-W>j

    set lines=43 " X lines tall
    set columns=110 " X cols wide

    if has("win32")
        map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
    endif
endif
