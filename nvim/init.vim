
call plug#begin(stdpath('data') . '/plugged')
Plug 'dracula/vim'
" InteliSense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" For async completion
"Plug 'Shougo/deoplete.nvim'
" For Denite features
Plug 'Shougo/denite.nvim'
" Linter
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()


autocmd FileType typescript setlocal completeopt+=menu,preview
set rtp+=/usr/bin/fzf
let g:deoplete#enable_at_startup = 1


if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:gitgutter_grep                    = 'rg'
let g:gitgutter_map_keys                = 0
let g:gitgutter_sign_added              = '▎'
let g:gitgutter_sign_modified           = '▎'
let g:gitgutter_sign_modified_removed   = '▶'
let g:gitgutter_sign_removed            = '▶'
let g:gitgutter_sign_removed_first_line = '◥'


let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"  Integrated Terminal
" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-t> :call OpenTerminal()<CR>

" Fuzzy search
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}


