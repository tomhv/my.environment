" Enable line numbering
set number

" Enable auto indent
set ai

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



call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'mattn/emmet-vim'
Plug 'ervandew/supertab'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/quickbuf'
call plug#end()



" Set space to toggle fold/unfold
nnoremap <silent> <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>

"Set up syntax highlighting for twig
au BufRead,BufNewFile *.twig set syntax=htmljinja
au BufRead,BufNewFile *.css set ft=css syntax=css3

"Set up auto closing of tags 
"http://vim.sourceforge.net/scripts/script.php?script_id=13
"Added by tom on 31 Aug 2009
au Filetype html,xml,xsl,php,symfony,htm,twig source $HOME/.vim/scripts/closetag.vim

"Insert date
:nnoremap <F2> "=strftime("%Y-%m-%d")<CR>P
:inoremap <F2> <C-R>=strftime("%Y-%m-%d")<CR>


"Insert datetime
:nnoremap <F3> "=strftime("%Y-%m-%d %H:%M:%S")<CR>P
:inoremap <F3> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

"Navigation between windows
:silent nmap <C-h>  :wincmd h<CR>
:silent nmap <C-j>  :wincmd j<CR>
:silent nmap <C-k>    :wincmd k<CR>
:silent nmap <C-l> :wincmd l<CR>

" Toggle paste/nopaste
nnoremap <F9> :set invpaste paste?<CR>

colorscheme default

" Show lines over 80 chars
hi LineTooLong ctermbg=236
match LineTooLong /\%>80v.\+/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""     Emmet
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:silent nmap <F12> <C-z>,
:silent imap <F12> <C-z>,
vmap <F12> <C-z>,
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-Z>'
autocmd FileType html,css,twig,htmldjango.twig EmmetInstall
let g:user_emmet_settings = {
\  'html' : {
\      'comment_type': 'lastonly',
\  },
\}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""     NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show hidden files on opening vim
let NERDTreeShowHidden=1
map <F7> :NERDTreeToggle<CR>

" Highlight cursor line in NERDTree 233 = #121212
hi CursorLine cterm=NONE ctermbg=233 guibg=233

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""     Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='angr'
