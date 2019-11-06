filetype plugin indent on
syntax on

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fzf
Plug 'jlanzarotta/bufexplorer' " bufexplorer
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

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
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

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
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if (argc() == 0 && !exists("s:std_in") && v:this_session == "") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ALE settings
call ale#Set('go_golint_executable', 'golint')
call ale#Set('go_golint_options', '')
let g:ale_set_highlights = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1

" Command shortcuts
" System shortcuts
noremap <leader>s :w<CR>
noremap <leader>w :wq<CR>
noremap <leader>q :q!<CR>
noremap <leader>v :vsplit<CR>
map <C-f> <C-u>

" FZF shortcuts
map <leader>f :FZF<CR>

" NERDTree shortcuts
map <C-n> :NERDTreeToggle<CR>
map // <Plug>NERDCommenterToggle

" BufExplorer shortcuts 
noremap <leader>e :BufExplorer<CR>
noremap <leader>ev :BufExplorerVerticalSplit<CR>
noremap <leader>eh :BufExplorerHorizontalSplit<CR>

