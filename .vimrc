" PLUGINS

call plug#begin()


    " file tree
    Plug 'preservim/nerdtree'


    " colorscheme
    Plug 'tomasr/molokai'
    Plug 'arcticicestudio/nord-vim'


    " theme
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'powerline/fonts'


    " autocomplete engine
    Plug 'neoclide/coc.nvim', {'branch': 'release'}


    " python autocomplete/linting
    Plug 'pappasam/coc-jedi'
    Plug 'nvie/vim-flake8'


    " supertab
    Plug 'ervandew/supertab'


call plug#end()




" THEME/COLORSCHEME

    " airline theme
    let g:airline_theme='nord'


    " colorscheme
    syntax enable
    set background=dark
    colorscheme nord




" SETTINGS

    " syntax highlighting
    syntax on


    " tab/indentation
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set smartindent


    " line numbers
    set nu
    set relativenumber


    " splitscreens
    set splitright
    set splitbelow


    " file navigation
    set scrolloff=8


    " search
    set ignorecase
    set incsearch


    " swapfile
    set noswapfile


    " colorcolumn
    set colorcolumn=80


    " signcolumn
    set signcolumn=yes




" KEY MAPPINGS

    " leader key
    let mapleader = " "


    " split navigation
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l


    " autocomplete
    inoremap <Tab> <C-y>


    " terminal
    nnoremap <leader>to :vert term<CR>


    " NERDTree
    nnoremap <leader>ft :NERDTreeToggle<CR>


    " brackets/quotes
    inoremap ( ()<Esc>i
    inoremap [ []<Esc>i
    inoremap { {}<Esc>i
    inoremap ' ''<Esc>i
    inoremap < <><Esc>i




" AUTOCOMMANDS
    
    " flake8
    autocmd BufWritePost *.py call flake8#Flake8()

