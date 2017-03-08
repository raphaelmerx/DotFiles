" Lines to be put at the top for Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'VundleVim/Vundle.vim'

" syntax highlighting
Bundle 'slim-template/vim-slim'
Bundle 'kien/ctrlp.vim'
Bundle 'quanganhdo/grb256'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/html5.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle "tpope/vim-fugitive"
Bundle "kchmck/vim-coffee-script"
Bundle "digitaltoad/vim-jade"
Bundle "scrooloose/nerdtree"
Bundle "mileszs/ack.vim"
Bundle "oplatek/Conque-Shell"
Bundle "bling/vim-airline"
Bundle "tpope/vim-surround"
Bundle "easymotion/vim-easymotion"
Bundle "hynek/vim-python-pep8-indent"

call vundle#end()

set autoindent
filetype plugin indent on
syntax enable
set shell=bash\ -i

" color scheme
colorscheme molokai
set background=dark
let g:molokai_original = 1

" highlight search results
set hlsearch

let g:ctrlp_lazy_update = 100
let g:ctrlp_clear_cache_on_exit = 1
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --ignore ''.pyc'' --hidden -g ""'
endif

" when space is pressed, clear all highlights
nnoremap <Space> :noh<CR>

" folding
set foldmethod=indent
set foldnestmax=2
" do not fold at start
set foldlevel=100

" always show the status line
set laststatus=2

set bs=2 "set backspace to be able to delete previous characters

" Smart way to move between tabs
map <leader>tt :tabnew<CR>
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>

" Quit insert mode
inoremap jj <Esc>

" faster YouCompleteMe
imap <Tab> <C-P>

" Indenting
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
let g:indentLine_color_term = 150

let g:used_javascript_libs = 'angularjs,underscore,backbone'

" syntastic
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" airline
let g:airline_powerline_fonts = 1 " correct display of Airline characters
let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', '%l/%L', ':%3v '])

nnoremap <leader>jd :YcmCompleter GoTo<CR>

" remove trailing whitespaces for Python files
autocmd BufWritePre *.py :%s/\s\+$//e

" set tags=./tags;$HOME
" set tags+=../.git/source_tags

set textwidth=120

" Easymotion https://github.com/easymotion/vim-easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap f <Plug>(easymotion-overwin-f)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" riotJS .tag highlighting
au BufNewFile,BufRead *.tag setlocal filetype=html
" force html filetype to html, to avoid filetype=htmldjango, which is good for Django tags highlighting, but which
" detects the {# <script> #}
au BufRead,BufNewFile *.html setlocal filetype=html

" ack uses ag
let g:ackprg = 'ag --nogroup --nocolor --column'

" .md files are markdown
au BufNewFile,BufRead *.md set filetype=markdown
let vim_markdown_preview_toggle = 1

" show line numbers
set nu
