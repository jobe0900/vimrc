" Inspiration from https://github.com/tlhunter/vimrc/blob/master/vimrc

" KEY MAPPINGS
" H = Home
" L = End
"
" Alt + n       = new buffer
" Alt + t       = new tab
" Alt + w       = close tab
" Alt + 1...9   = go to that tab
"
" Leader + s    = toggle whitespace
" Leader + c    = copy
" Leader + v    = paste
" Leader + cd   = change working directory
" Leader + hjkl = move among windows
" Leader + Q    = close window
" Leader + q    = close buffer
" Leader + T    = delete Trailing space
" Leader + U    = delete Unwanted lines
" Leader + R    = Replace tabs with spaces
" Leader + n    = NERDtree toggle
" Leader + m    = NERDtree focus
" Leader + c<sp>= toggle comment
" Leader + cs   = pretty comment
" Leader + rp   = rainbow parenthesis
"
" Ctrl + h/left = prevoius buffer
" Ctrl + l/rght = next buffer
"
" F2 = toggle paste
" F8 = toggle tagbar
"


" Use Pathogen to install bundle plugins
execute pathogen#infect()

" -- INSTALLED BUNDLES --------------------
" NERDcommenter
"                 https://github.com/scrooloose/nerdcommenter.git
" Tagbar
"                 https://github.com/majutsushi/tagbar
" NERDtree
"     2015-11-21  https://github.com/scrooloose/nerdtree
"     2015-11-21  https://github.com/jistr/vim-nerdtree-tabs
"     2015-11-21  https://github.com/Xuyuanp/nerdtree-git-plugin
" AirLine
"     2015-11-21  https://github.com/bling/vim-airline
" Closetag
"     2015-11-21  https://github.com/alvan/vim-closetag
" Neocomplete
"     2015-11-21  https://github.com/Shougo/neocomplete.vim
" Syntastic
"     2015-11-21  https://github.com/scrooloose/syntastic
" Easytags
"                 https://github.com/xolox/vim-easytags
" Misc
"                 https://github.com/xolox/vim-misc
" sensible.vim
"     2015-11-21  https://github.com/tpope/vim-sensible.git
" lexima.vim
"     2015-12-07  https://github.com/cohama/lexima.vim
" Clojure
"                 https://github.com/guns/vim-clojure-static
"                 https://github.com/guns/vim-clojure-highlight
" Paredit
 "                https://github.com/vim-scripts/paredit.vim
" RainbowParentheses
"                 https://github.com/kien/rainbow_parentheses.vim
" Fireplace
"                 https://github.com/tpope/vim-fireplace
" vim-pug for Jade
"     2016-03-01  https://github.com/digitaltoad/vim-pug.git 



" -- UNINSTALLED BUNDLES ------------------
" vim-go
" YouCompleteMe

" -- VISUAL --------------------------------------------------------------
syntax on
set nowrap
set vb "visual bell
set ruler
set colorcolumn=80
set number
set cursorline

" Use a nice colorscheme and font
colorscheme molokai
if has("gui_running")
	let g:molokai_original = 1
	set guifont=Hack\ 10
	" Alt+n = new buffer
	map <silent> <A-n> :enew<CR>

	" Alt+t = new tab
	nnoremap <silent> <A-t> :tabnew<CR>

	" Alt+w = close tab
	nnoremap <silent> <A-w> :tabclose<CR>

	" Alt+1...9 = go to that tab
	map <silent> <A-1> 1gt
	map <silent> <A-2> 2gt
	map <silent> <A-3> 3gt
	map <silent> <A-4> 4gt
	map <silent> <A-5> 5gt
	map <silent> <A-6> 6gt
	map <silent> <A-7> 7gt
	map <silent> <A-8> 8gt
	map <silent> <A-9> 9gt
else
	set t_Co=256
	let g:rehash256 = 1
	set mouse=a
endif



" -- GENERAL BEHAVIOR ----------------------------------------------------

" Save backupfiles in vim directory
set directory=$HOME/.vim/swapfiles//

set tabstop=4
set shiftwidth=4
filetype plugin on
filetype indent on
set autoindent
" C specific indentation
"set cindent

" omnicomplete
set omnifunc=syntaxcomplete#Complete

" UTF8 encoding
set encoding=utf-8
setglobal fileencoding=utf-8

"allow deletion of previously entered data in insert mode
set backspace=indent,eol,start


" -- KEY MAPPINGS --------------------------------------------------------

" Toggle whitespace
nmap <Leader>s :set list!<CR>
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
:set list " Enable by default

" F2 = Paste Toggle (in insert mode, pasting indented text behavior changes)
set pastetoggle=<F2>

" Paste
map <Leader>v "+gP
" Copy
map <Leader>c "+y
" When pressing <Leader>cd switch to the directory of the open buffer
map <Leader>cd :cd %:p:h<CR>


" -- NAVIGATION -----------------------------------------------------------

" -- Text -----------------------------
"  H = home, L = end
noremap H ^
noremap L $
vnoremap L g_

" -- Window ---------------------------
" <Leader>hjkl =  move between windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
" Close window
nnoremap <silent> <Leader>Q <C-w>c

" -- Buffer ---------------------------
"  Cycle between buffers with ctrl
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>
" Close buffer
nnoremap <silent> <Leader>q :bp<CR>:bd #<CR>



" -- OTHER ----------------------------------------------------------------
"------  Text Editing Utilities  ------
"" <Leader>T = Delete all Trailing space in file
map <Leader>T :%s/\s\+$//<CR>

" <Leader>U = Deletes Unwanted empty lines
 map <Leader>U :g/^$/d<CR>

" <Leader>R = Converts tabs to spaces in document
map <Leader>R :retab<CR>


" -- PLUGIN SPECIFIC -------------------------------------------------------
"
" -- NERDtree -------------------------
let NERDTreeIgnore=['CVS','\.dSYM$', '.git', '.DS_Store', '*.swp', '*.swo','*.swo']

"setting root dir in NT also sets VIM's cd
let NERDTreeChDirMode=2

" Toggle visibility using <Leader>n
noremap <silent> <Leader>n :NERDTreeToggle<CR>
" Focus on NERDTree using <Leader>m
noremap <silent> <Leader>m :NERDTreeFocus<CR>

" These prevent accidentally loading files while focused on NERDTree
autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>

" Open NERDTree if we're executing vim without specifying a file to open
autocmd vimenter * if !argc() | NERDTree | endif

" Hides "Press ? for help"
let NERDTreeMinimalUI=1

" Shows invisibles
let g:NERDTreeShowHidden=1


" -- NERDcommenter --------------------
" NERDcommenter (comment \cc)  (toggle comment \c[space]) (pretty comment \cs)


" -- TagBar ---------------------------
nmap <F8> :TagbarToggle<CR>

" -- AirLine --------------------------
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" -- Closetag -------------------------
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
":au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim

" -- Neocomplete ----------------------
let g:neocomplete#enable_at_startup = 1
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags



" -- LANGUAGES ---------------------------------------------------------------
"
" -- Clojure --------------------------

" Clojure Paredit
let g:paredit_leader = '\'

" Clojure syntax
autocmd VimEnter *       RainbowParenthesesToggle
autocmd Syntax   clojure RainbowParenthesesLoadRound
autocmd Syntax   clojure RainbowParenthesesLoadSquare
autocmd Syntax   clojure RainbowParenthesesLoadBraces
nnoremap <leader>rp :RainbowParenthesesToggle<CR>

" -- HTML -----------------------------
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" -- JavaScript -----------------------
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" -- Jade template --------------------
autocmd FileType jade setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType jade setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" -- Go -------------------------------
" vim-go syntax highlighting
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1

" gotags for the tagbar
"let g:tagbar_type_go = {
    "\ 'ctagstype' : 'go',
    "\ 'kinds'     : [
        "\ 'p:package',
        "\ 'i:imports:1',
        "\ 'c:constants',
        "\ 'v:variables',
        "\ 't:types',
        "\ 'n:interfaces',
        "\ 'w:fields',
        "\ 'e:embedded',
        "\ 'm:methods',
        "\ 'r:constructor',
        "\ 'f:functions'
    "\ ],
    "\ 'sro' : '.',
    "\ 'kind2scope' : {
        "\ 't' : 'ctype',
        "\ 'n' : 'ntype'
    "\ },
    "\ 'scope2kind' : {
        "\ 'ctype' : 't',
        "\ 'ntype' : 'n'
    "\ },
    "\ 'ctagsbin'  : 'gotags',
    "\ 'ctagsargs' : '-sort -silent'
"\ }

" -- DISABLED ---------------------------------------------------------
" Possible fixes for performance (don't thin they work)
":set nocursorcolumn
":set nocursorline
":set lazyredraw
":set ttyfast
