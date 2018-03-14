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
:silent nmap <C-LEFT>  :wincmd h<CR>
:silent nmap <C-DOWN>  :wincmd j<CR>
:silent nmap <C-UP>    :wincmd k<CR>
:silent nmap <C-RIGHT> :wincmd l<CR>

"Toggle paste/nopaste
nnoremap <F9> :set invpaste paste?<CR>

colorscheme default
