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
"set tags=TAGS

let php_folding = 1
let html_folding = 1

"Set live search
"set incsearch

" Show trailing spaces
set list listchars=trail:-

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin'
"Plug 'mattn/emmet-vim'
"Plug 'ervandew/supertab'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
call plug#end()

" Set space to toggle fold/unfold
nnoremap <silent> <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>

"Set up syntax highlighting for twig
au BufRead,BufNewFile *.twig set syntax=htmljinja
au BufRead,BufNewFile *.css set ft=css syntax=css3

"Set up auto closing of tags 
"http://vim.sourceforge.net/scripts/script.php?script_id=13
"Added by tom on 31 Aug 2009
" au Filetype html,xml,xsl,php,symfony,htm,twig source $HOME/.vim/scripts/closetag.vim

"Insert date
:nnoremap <F2> "=strftime("%Y-%m-%d")<CR>P
:inoremap <F2> <C-R>=strftime("%Y-%m-%d")<CR>
:inoremap <Tab> <C-n>

"Navigation between windows
:silent nmap <C-h>  :wincmd h<CR>
:silent nmap <C-j>  :wincmd j<CR>
:silent nmap <C-k>    :wincmd k<CR>
:silent nmap <C-l> :wincmd l<CR>

" Toggle paste/nopaste
nnoremap <F9> :set invpaste paste?<CR>

colorscheme desert

" Highlight cursor line in NERDTree 233 = #121212
hi CursorLine cterm=NONE ctermbg=DarkGray guibg=DarkGray

" Show lines over 80 chars
hi LineTooLong ctermbg=DarkGray
match LineTooLong /\%>80v.\+/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""     Emmet
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   :silent nmap <F12> <C-z>,
"   :silent imap <F12> <C-z>,
"   vmap <F12> <C-z>,
"   let g:user_emmet_install_global = 0
"   let g:user_emmet_leader_key='<C-Z>'
"   autocmd FileType html,css,twig,javascript.jsx EmmetInstall
"   let g:user_emmet_settings = {
"   \  'html' : {
"   \      'comment_type': 'lastonly',
"   \  },
"   \}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""     NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show hidden files on opening vim
let NERDTreeShowHidden=1
map <F7> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""     Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='angr'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""     CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:nnoremap <F4> :CtrlPBuffer<CR>
:nnoremap <F5> :CtrlPMRUFiles<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""     PHPActor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

" Add the following to your .vimrc in order to use Phpactor for omni-completion
" (for PHP files):
autocmd FileType php setlocal omnifunc=phpactor#Complete





function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
