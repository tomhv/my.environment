" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
" set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
"if has("autocmd")
"  filetype indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes) in terminals

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set number
set ai " auto indent

" Set F5 and F6 to scroll back and forth through buffers
:silent map <F5> :bprevious<CR>
:silent map <F6> :bnext<CR>

" Set F7 and F8 to scroll back and forth through tabs
:silent map <F7> :tabprevious<CR>
:silent map <F8> :tabnext<CR>

" Set tabs to spaces
set et
set sw=4
set sts=4
set smarttab

" Load tags
set tags=TAGS

let php_folding = 1
let html_folding = 1

"Set live search
set incsearch

" Show trailing spaces
set list
set listchars=trail:-

" Set space to toggle fold/unfold
nnoremap <silent> <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>

"VTreeExplorer settings
"http://www.vim.org/scripts/script.php?script_id=184
"Added by tom on 31 Aug 2009
let treeExplVertical = 1
let treeExplIndent = 4
let treeExplWinSize = 62

"Set up syntax highlighting for twig
au BufRead,BufNewFile *.twig set syntax=htmljinja
au BufRead,BufNewFile *.twig source $HOME/.vim/scripts/closetag.vim

au BufRead,BufNewFile *.css set ft=css syntax=css3

au BufRead,BufNewFile *.ascx set ft=asp syntax=html

"Set up auto closing of tags 
"http://vim.sourceforge.net/scripts/script.php?script_id=13
"Added by tom on 31 Aug 2009
au Filetype html,xml,xsl,php,symfony,htm source $HOME/.vim/scripts/closetag.vim

"Insert date
:nnoremap <F2> "=strftime("%Y-%m-%d")<CR>P
:inoremap <F2> <C-R>=strftime("%Y-%m-%d")<CR>


"Insert datetime
:nnoremap <F3> "=strftime("%Y-%m-%d %H:%M:%S")<CR>P
:inoremap <F3> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

"Navigation between windows
:silent nmap <C-LEFT>  :wincmd h<CR>
:silent nmap <C-DOWN>  :wincmd j<CR>
:silent nmap <C-UP>    :wincmd k<CR>
:silent nmap <C-RIGHT> :wincmd l<CR>

"Toggle paste/nopaste
nnoremap <F9> :set invpaste paste?<CR>
"inoremap <F9> <C-O>:set invpaste paste?<CR>
