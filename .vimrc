filetype plugin indent on
syntax on

call plug#begin('~/.vim/plugged')

Plug 'terryma/vim-smooth-scroll'
Plug 'panozzaj/vim-autocorrect'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jlanzarotta/bufexplorer' " bufexplorer
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ntpeters/vim-better-whitespace'
" Used to search and replace content from files
Plug 'dyng/ctrlsf.vim'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

call plug#end()

" Common settings
set nocompatible
set completeopt=preview,menu
set number
set hlsearch
set incsearch
set enc=utf-8
set scrolloff=3
set expandtab " Expand Tabs (pressing Tab inserts spaces)"
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set splitbelow
set splitright
set noerrorbells
set vb t_vb=

" Code smart indent
set autoindent
set cindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" vim-go settings
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
map <leader>r :GoRun<CR>

" Code auto complete
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
"function! ClosePair(char)
    "if getline('.')[col('.') - 1] == a:char
        "return "\<Right>"
    "else
        "return char
    "endif
"endfunction

" Setting mapleader
let mapleader=","

" Setting backspace in insert mode
:set backspace=indent,eol,start

" FZF initialize
set rtp+=~/.fzf

" Omnifunc settings
let OmniCpp_SelectFirstItem = 1

" SuperTab settings
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCrMapping = 1
let g:SuperTabLongestEnhanced = 1
let g:SuperTabCompletionContexts = ['s:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery =  ["&omnifunc:<c-x><c-o>"]
autocmd FileType * if &omnifunc != '' | call SuperTabChain(&omnifunc, "<c-p>") | call SuperTabSetDefaultCompletionType("<c-x><c-u>") | endif

" NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if (argc() == 0 && !exists("s:std_in") && v:this_session == "") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ALE settings
autocmd QuitPre * if empty(&bt) | lclose | endif
call ale#Set('go_golint_executable', 'golint')
call ale#Set('go_golint_options', '')
let g:ale_set_highlights = 0
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:ale_fix_on_save = 1

" CtrlSF settings
let g:ctrlsf_ackprg = 'ag'

" Command shortcuts
" System shortcuts
map      <Space>   viw
onoremap p         i(
noremap  <leader>s :w<CR>
noremap  <leader>w :wq<CR>
noremap  <leader>q :q!<CR>
noremap  <leader>v :vsplit<CR>
inoremap <C-c>     <Esc>
noremap  <silent>  <C-e> $
noremap  <silent>  <C-a> ^
inoremap <silent>  <C-d> <Esc>ddi
nnoremap <C-h>     <C-w>h
nnoremap <C-j>     <C-w>j
nnoremap <C-k>     <C-w>k
nnoremap <C-l>     <C-w>l
inoremap <silent>  <C-e> <C-o>A
inoremap <silent>  <C-a> <C-o>I
inoremap <silent>  <C-z> <C-o>u
inoremap <silent>  <C-s> <C-o>:w<CR>
noremap  <silent>  <C-s> :w<CR>
" map <C-f> <C-u>

" Change buffer
nnoremap [b        :bp<CR>
nnoremap ]b        :bn<CR>
map      <leader>1 :b 1<CR>
map      <leader>2 :b 2<CR>
map      <leader>3 :b 3<CR>
map      <leader>4 :b 4<CR>
map      <leader>5 :b 5<CR>
map      <leader>6 :b 6<CR>
map      <leader>7 :b 7<CR>
map      <leader>8 :b 8<CR>
map      <leader>9 :b 9<CR>

" FZF shortcuts
map <leader>f :FZF<CR>

" NERDTree shortcuts
map <C-n> :NERDTreeToggle<CR>
map //    <Plug>NERDCommenterToggle
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>

" BufExplorer shortcuts
noremap <leader>e  :BufExplorer<CR>
noremap <leader>ev :BufExplorerVerticalSplit<CR>
noremap <leader>eh :BufExplorerHorizontalSplit<CR>

" EasyAlign shortcuts
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Ctrlsf shortcuts
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
