" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
    Plug 'puremourning/vimspector'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " Plug 'ycm-core/YouCompleteMe'
    Plug 'jdhao/better-escape.vim'
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-repeat'
    " Install astyle for this plugin 
    Plug 'Chiel92/vim-autoformat'
    Plug 'mileszs/ack.vim'

" Initialize plugin system
call plug#end()

set termguicolors
syntax enable
set background=light
colorscheme gruvbox
set shiftwidth=4
set autoindent
set smartindent
set tabstop=4
set expandtab
" inoremap {<cr> {<cr>}<c-o>O
set t_ut=
set encoding=utf-8
set fileencoding=utf-8
set listchars=eol:$,tab:>·,space:.
set number
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
" set go-=m
" set go-=T
set go-=r
set go-=L
" install wmctrl from apt for the below command to work"
autocmd GUIEnter * call system("wmctrl -ir " . v:windowid . " -b add,maximized_vert,maximized_horz")
" nnoremap p p=`]
" nnoremap P P=`]
" nnoremap <c-p> p
command WQ wq
command Wq wq
command W w
command Q q
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile
function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction
set laststatus=2
highlight Comment cterm=italic gui=italic
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
let g:fzf_layout = { 'up': '~40%' }
nmap <C-P> :Files<CR>
set guifont=Jetbrains\ Mono\ 10
" nnoremap <silent> <F3> :exec &nu==&rnu? 'se nu!' : 'se rnu!'<CR>
se is hls
noremap <F3> :Autoformat<CR>
" au BufWrite * :Autoformat
let g:formatdef_my_custom_cpp = '"astyle --mode=c -A2 -pcHs".&shiftwidth'
let g:formatters_cpp = ['my_custom_cpp']
nnoremap <nowait><silent> <C-L> :noh<CR>
" nnoremap <C-H> <C-W>h
" nnoremap <C-J> <C-W>j
" nnoremap <C-K> <C-W>k
" nnoremap <C-L> <C-W>l
set timeout ttimeout         " separate mapping and keycode timeouts
set timeoutlen=300           " mapping timeout 250ms  (adjust for preference) (change this for { } completion)
set ttimeoutlen=20           " keycode timeout 20ms
set cinoptions+=L0
tnoremap <C-n> <C-\><C-n>
tnoremap <C-v> <C-w>"+
" let g:better_escape_shortcut = 'jk'
let g:better_escape_interval = 150
inoremap <expr> <CR>
    \ col('.') ==# col('$')
    \ && getline('.')[col('.')-2] ==# '{'
    \ ? "\<CR>}\<C-O>O"
    \ : "\<CR>"
autocmd BufNewFile *.cpp 0r /home/yasser/workspace/competitive/Template.cpp
