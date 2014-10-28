" Lines to be put at the top for Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" other plugins
Bundle 'slim-template/vim-slim'
Bundle 'kien/ctrlp.vim'
Bundle 'FelikZ/ctrlp-py-matcher'
Bundle 'quanganhdo/grb256'
Bundle 'Valloric/YouCompleteMe'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/html5.vim'
Bundle 'scrooloose/syntastic'
Bundle "wookiehangover/jshint.vim"
Bundle "kevinw/pyflakes-vim"
Bundle "tpope/vim-fugitive"


call vundle#end()

" execute pathogen#infect()
" syntax on

set autoindent
filetype plugin indent on
syntax enable

" color scheme
colorscheme molokai
set background=dark

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
set foldlevelstart=100

let g:molokai_original = 1
set laststatus=2

set bs=2 "set backspace to be able to delete previous characters
set number "display line number

" Smart way to move between tabs
map <leader>tt :tabnew<CR>
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>

" Quit insert mode faster
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
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L

" syntastic
let g:syntastic_python_checkers = ['pyflakes']

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
            return 'PASTE MODE  '
                en
                    return ''
                    endfunction
