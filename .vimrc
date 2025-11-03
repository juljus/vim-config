" ============================================================================
" PLUGINS
" ============================================================================

call plug#begin()

    " ---- File Navigation & UI ----
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " ---- Appearance ----
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'

    " ---- Autocomplete & LSP (Language Server Protocol) ----
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " ---- Bracket & Quote Auto-pairing ----
    Plug 'jiangmiao/auto-pairs'

    " ---- Commenting ----
    Plug 'preservim/nerdcommenter'

    " ---- Git Integration ----
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " ---- Text Objects & Motion ----
    Plug 'tpope/vim-surround'

call plug#end()

" ============================================================================
" THEME & COLORSCHEME
" ============================================================================

syntax enable
set background=dark
colorscheme gruvbox


" ============================================================================
" GENERAL SETTINGS
" ============================================================================

" Syntax & Highlighting
syntax on

" Tab & Indentation (Python standard: 4 spaces)
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" Line Numbers
set number
set relativenumber

" Split Navigation
set splitright
set splitbelow

" Scrolling & Navigation
set scrolloff=8
set sidescroll=8

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" Performance & Safety
set noswapfile
set undofile
set undodir=~/.vim/undo

" Visual Indicators
set signcolumn=yes
" set cursorline  " Disabled due to terminal rendering issues with visual selection

" Folding
set foldmethod=indent
set foldlevel=99

" Timeout for mappings
set timeoutlen=500

" ============================================================================
" KEY MAPPINGS
" ============================================================================

let mapleader = " "

" --- Split Navigation ---
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" --- File Navigation ---
nnoremap <leader>ft :w<CR>:NERDTreeToggle<CR>
nnoremap <leader>ff :w<CR>:Files<CR>
nnoremap <leader>fb :w<CR>:Buffers<CR>
nnoremap <leader>fl :w<CR>:Lines<CR>

" --- Terminal ---
nnoremap <leader>to :vert term<CR><C-\><C-n>:vertical resize 50<CR>i

" Terminal mode navigation - use <C-\><C-n> to exit terminal mode, then use Ctrl+hjkl
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l


" --- Comments (vim-nerdcommenter handles this now) ---
" <leader>cc to comment
" <leader>cu to uncomment
" <leader>c<space> to toggle comment

" --- Search ---
nnoremap <leader>hs :noh<CR>

" --- Formatting ---
nnoremap <leader>fw :%s/\s\+$//e<CR>           " Remove trailing whitespace
nnoremap <leader>f= gg=G                        " Auto-format entire file

" --- Git Integration ---
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gp :Git push<CR>

" ============================================================================
" COC (Conquer of Completion) CONFIGURATION
" ============================================================================

" Use <Tab> to navigate completion menu
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <S-Tab>
      \ coc#pum#visible() ? coc#pum#prev(1) :
      \ "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-space> to trigger completion manually
if has('nvim')
  inoremap <silent><expr> <C-space> coc#refresh()
else
  inoremap <silent><expr> <C-@> coc#refresh()
endif

" Accept completion with <CR>
inoremap <silent><expr> <CR>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" --- GoTo code navigation ---
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" --- Hover documentation ---
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" --- Rename symbol ---
nmap <leader>rn <Plug>(coc-rename)

" --- Format selected code ---
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" --- Show diagnostics ---
nnoremap <leader>cd :<C-u>CocList diagnostics<CR>

" ============================================================================
" AUTO-PAIRS CONFIGURATION
" ============================================================================

let g:AutoPairsMapCR = 1           " Map <CR> to insert newline between pairs
let g:AutoPairsUseInsertedCount = 1

" ============================================================================
" NERDTree CONFIGURATION
" ============================================================================

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc$', '__pycache__', '\.git$', 'node_modules']

" ============================================================================
" FZF CONFIGURATION
" ============================================================================

let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" ============================================================================
" C COMPILATION
" ============================================================================

" Run compiled program
nnoremap <leader>cr :!./%:h/build/%:t:r<CR>

" Compile and run current C file
nnoremap <leader>car :w<CR>:!mkdir -p %:h/build && gcc -Wall -Werror -Werror=vla -g % -o %:h/build/%:t:r && ./%:h/build/%:t:r<CR>

" ============================================================================
" AUTOCOMMANDS
" ============================================================================

augroup CustomAutocommands
  autocmd!
  " Remove trailing whitespace on save
  autocmd BufWritePre * :%s/\s\+$//e
  " Enable spell checking for markdown and text files
  autocmd FileType markdown,text setlocal spell
augroup END

