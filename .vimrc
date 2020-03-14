" https://bluz71.github.io/2017/05/21/vim-plugins-i-like.html
set rtp+=/usr/bin/fzf
map <C-n> :NERDTreeToggle<CR>
map <C-_> :FZF<CR>
let g:NERDTreeNodeDelimiter = "\u00a0"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
noremap <silent> <Leader>f :NERDTreeFind<CR> <C-w>=
let g:indentLine_faster     = 1
let g:indentLine_setConceal = 0
let g:NERDTreeDirArrowExpandable  = "▷"
let g:NERDTreeUpdateOnCursorHold = 0
let g:NERDTreeUpdateOnWrite      = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeWinSize = 31
let g:NERDTreeChDirMode = 2
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeCascadeOpenSingleChildDir = 1
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction
autocmd BufEnter * call NERDTreeRefresh()
let g:grepper = {}
let g:grepper.tools = ["rg"]
runtime autoload/grepper.vim
let g:grepper.jump = 1
nnoremap <Leader>/ :GrepperRg<Space>
nnoremap gs :Grepper -cword -noprompt<CR>
xmap gs <Plug>(GrepperOperator)
let g:undotree_HighlightChangedWithSign = 0
let g:undotree_WindowLayout             = 4
nnoremap <Leader>u :UndotreeToggle<CR>
let g:airline_theme='luna'
let g:airline#extensions#ale#enabled = 1
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_non_errors = l:counts.total - l:all_errors
    let l:all_errors = l:counts.error + l:counts.style_error

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
let g:gitgutter_grep                    = 'rg'
let g:gitgutter_map_keys                = 0
let g:gitgutter_sign_added              = '▎'
let g:gitgutter_sign_modified           = '▎'
let g:gitgutter_sign_modified_removed   = '▶'
let g:gitgutter_sign_removed            = '▶'
let g:gitgutter_sign_removed_first_line = '◥'
nmap [g <Plug>GitGutterPrevHunkzz
nmap ]g <Plug>GitGutterNextHunkzz
nmap <Leader>p <Plug>GitGutterPreviewHunk
nmap <Leader>+ <Plug>GitGutterStageHunk
nmap <Leader>- <Plug>GitGutterUndoHunk
set updatetime=300
set statusline=%{LinterStatus()}
let g:ale_sign_column_always = 1
nnoremap <silent> <Leader>B :Gblame<CR>
nnoremap <silent> <Leader>C :Gclog %<CR>
nnoremap <silent> <Leader>G :Gstatus<CR>
syntax on
