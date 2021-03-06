if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug '~/.config/nvim/plugins/dracula-pro'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'camspiers/lens.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'
Plug 'jremmen/vim-ripgrep'
let g:coc_global_extensions = [
  \ ]

Plug 'junegunn/fzf'

call plug#end()

set encoding=UTF-8
set number
syntax enable

function! s:hascolorscheme(name) abort
    let pat = 'colors/'.a:name.'.vim'
    return !empty(globpath(&rtp, pat))
endfunction

if s:hascolorscheme('dracula_pro')
  let g:dracula_colorterm = 0
  colorscheme dracula_pro
endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let g:NERDTreeIgnore = ['^node_modules$']

inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
nmap <C-P> :FZF<CR>
nmap <C-T> :Rg<space>
 
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ' '
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd CursorHold * silent call CocActionAsync('highlight')
set smarttab
set cindent

" Enable mouse
set mouse=a

" Set clipboard
set clipboard=unnamedplus

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

nmap <F8> :TagbarToggle<CR>

let g:airline#extensions#tabline#enabled = 1
