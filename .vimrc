" Plugins
call plug#begin()

    " NERDTree
    'preservim/nerdtree'

    " CoC (autocompletion)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Flake8 (python linting)
    Plug 'nvie/vim-flake8'

    " Install colorscheme
    Plug 'gosukiwi/vim-atom-dark'

    " Install airline theme
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

call plug#end()



" Theme/colorscheme
colorscheme atom-dark-256
let g:airline_theme='gruvbox'



" Settings

    " Syntax highlighting
    syntax on

    " Tab/indentation
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set smartindent

    " Line numbers
    set nu
    set relativenumber

    " File navigation
    set scrolloff=8

    " Search
    set ignorecase
    set incsearch

    " Swapfile
    set noswapfile

    " Sidecolumns
    set signcolumn=yes
    set colorcolumn=80



" Key mappings

    " Leader key
    let mapleader = " "

    " Split navigation
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

    " NERDTree
    nnoremap <C-z> :NERDTreeToggle<CR>



" Autocommands

    " NERDTree
    autocmd VimEnter * NERDTree

    " Flake8
    autocmd BufWritePost *.py call flake8#Flake8()
