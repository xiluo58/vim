if has('vim_starting')
	set nocompatible               " Be iMproved
	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

if has("gui_running")
	set guifont=Menlo:h9
	set lines=999 columns=999
	if has("gui_macvim")
		"set guifont=Menlo
		"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
		set guifont=Sauce\ Code\ Powerline:h12
		"set guifont=Inconsolata:h13
	endif
endif

set number
set relativenumber
set nowrap
colorscheme molokai
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=m
set guioptions-=T
set diffopt+=vertical
set synmaxcol=256
syntax on

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
set hlsearch
set incsearch

let mapleader = ","

" display indentation guides
set list listchars=tab:\|\ ,trail:·,extends:»,precedes:«,nbsp:×

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))


" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" You can specify revision/branch/tag.
" NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }


"------------ Bundles ---------------
"NeoBundle 'JavaScript-Indent'
"NeoBundle 'chrisbra/Colorizer'
"NeoBundle 'thinca/vim-quickrun'
NeoBundle 'L9'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'bling/vim-airline'
NeoBundle 'christoomey/vim-conflicted'
NeoBundle 'docunext/closetag.vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'elzr/vim-json'
NeoBundle 'godlygeek/tabular'
NeoBundle 'groenewege/vim-less'
NeoBundle 'honza/vim-snippets'
NeoBundle 'ihacklog/HiCursorWords'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
"NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'yegappan/mru'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

call neobundle#end()
" Required:
filetype plugin indent on

"------------- Key Mappings --------------------
map <F1> :NERDTreeToggle<CR>
map <F2> :let b:tagbar_ignore=0<CR>:TagbarToggle<CR>
"map <F2> :TagbarToggle<CR>
map <leader>fj :%!python -m json.tool<CR>
map <leader>fx :% !xmllint --format -<CR>
map <leader>nr :NERDTree root<CR>
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
nmap <leader>gf :CtrlP<CR><C-\>w
nmap <leader>ag :Ag <c-r>"<cr>
nmap <leader>agw :Ag <c-r><c-w> -w<cr>
" Copy current buffer path relative to root of VIM session to system clipboard
nnoremap <Leader>yp :let @*=expand("%")<cr>:echo "Copied file path to clipboard"<cr>
" Copy current filename to system clipboard
nnoremap <Leader>yf :let @*=expand("%:t:r")<cr>:echo "Copied file name to clipboard"<cr>
" Copy current buffer path without filename to system clipboard
nnoremap <Leader>yd :let @*=expand("%:h")<cr>:echo "Copied file directory to clipboard"<cr>
nnoremap <Leader>yff :let @*=expand("%:p")<cr>:echo "Copied file directory to clipboard"<cr>

nnoremap <leader>nf :NERDTreeFind<cr>



inoremap jk <esc>
"------------- Key Mappings --------------------
"To support custom tag
let g:html_indent_tags='\w\+'

" For NerdTree
let NERDChristmasTree=1
let NERDTreeMouseMode=2

call NERDTreeAddKeyMap({'key': 't', 'callback': 'NERDTreeMyOpenInTab', 'scope': 'FileNode', 'override': 1 })
function NERDTreeMyOpenInTab(node)
	    call a:node.open({'reuse': "all", 'where': 't'})
endfunction

" For easymotion
let g:EasyMotion_do_mapping = 1

let b:tagbar_ignore = 1
let g:tagbar_compact = 1
let g:tagbar_autofocus = 1
"let g:tagbar_ctags_bin = ~/jsctags/lib/jsctags

" For ctrlp
let g:ctrlp_clear_cache_on_exit = 0


au FileType javascript setl fen

set laststatus=2 " So status bar will always be shown
" For javascript-libraries-syntax.vim
"let g:used_javascript_libs = 'jquery'

" Ultisnip youcompleteme compatible begin
function! g:UltiSnips_Complete()
	call UltiSnips#ExpandSnippet()
	if g:ulti_expand_res == 0
		if pumvisible()
			return "\<C-n>"
		else
			call UltiSnips#JumpForwards()
			if g:ulti_jump_forwards_res == 0
				return "\<TAB>"
			endif
		endif
	endif
	return ""
endfunction

"au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-l>"
" Ultisnip youcompleteme compatible end
let g:UltiSnipsExpandTrigger="<c-tab>"

let g:UltiSnipsSnippetDirectories = ["UltiSnips"]

let g:indent_guides_guide_size=1
"let g:indent_guides_enable_on_vim_startup = 1

" --------------- Project specific ----------------------
set dir=~/.vimswap//
" set default pwd
" --------------- Project specific ----------------------
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:delimitMate_expand_cr = 2

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:mustache_abbreviations = 1

augroup myGroup
	autocmd!
	autocmd BufNewFile,BufRead *.less set filetype=less
	autocmd BufNewFile,BufRead *.less set syntax=less
	autocmd BufWritePost .vimrc so $MYVIMRC
augroup END


" For Ag
let g:ag_prg="ag --column --smart-case --hidden --ignore='*.min.*'"
let g:ag_highlight=1


" For NerdComment
let g:NERDCustomDelimiters = {
			\ 'html.mustache': { 'left': '<!--', 'leftAlt': '{{!', 'right': '-->', 'rightAlt': '}}' }
			\ }



