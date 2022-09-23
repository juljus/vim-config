" PLUGINS

call plug#begin()


    " file tree
    Plug 'preservim/nerdtree'


    " colorscheme
    Plug 'morhetz/gruvbox'


    " theme
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'


    " autocomplete
    Plug 'neoclide/coc.nvim'


    " supertab
    Plug 'ervandew/supertab'


    " python linting
    Plug 'nvie/vim-flake8'


call plug#end()




" THEME/COLORSCHEME

    " theme
    let g:airline_solarized_bg='dark'


    " colorscheme
    set background=dark
    colorscheme gruvbox




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




" KEY MAPPINGS

    " leader key
    let mapleader = " "


    " split navigation
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l


    " terminal
    nnoremap <leader>to :vert term<CR>


    " NERDTree
    nnoremap <leader>ft :NERDTreeToggle<CR>




" AUTOCOMMANDS
    
    " flake8
    autocmd BufWritePost *.py call flake8#Flake8()

