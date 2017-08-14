let g:vimFolder = "~/.vim/"
if has("win32")
	let g:vimFolder = "~/vimfiles/"
endif

if has('vim_starting')
	set nocompatible               " Be iMproved
	execute "set runtimepath+=".g:vimFolder."bundle/neobundle.vim/"
endif

if has("gui_running")
	" set lines=999 columns=999
	if has("win32")
		 au GUIEnter * simalt ~x
		 set guifont=SauceCodePro_NF:h10
	 endif
	if has("gui_macvim")
		" set guifont=Monaco:h13
		set guifont=Sauce\ Code\ Pro\ Medium\ Nerd\ Font\ Complete\ Mono:h14 
	endif
endif

set number
set relativenumber
set nowrap
set encoding=UTF-8


set guioptions-=r "remove right-hand scroll bar
set guioptions-=L "remove left-hand scroll bar
set guioptions-=m
set guioptions-=T
set diffopt+=vertical
" set synmaxcol=5120
syntax on

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
set hlsearch
set incsearch

" set foldmethod=syntax
set foldmethod=indent
" Don't fold by default
au BufWinEnter * normal zR

let mapleader = ","

" display indentation guides
"set list listchars=tab:\|\ ,trail:·,extends:»,precedes:«,nbsp:×

" Required:
call neobundle#begin(expand(g:vimFolder."bundle/"))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" You can specify revision/branch/tag.
" NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }


"------------ Bundles ---------------
"NeoBundle 'JavaScript-Indent'
NeoBundle 'chrisbra/Colorizer'
NeoBundle 'lfilho/cosco.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'bling/vim-airline'
NeoBundle 'docunext/closetag.vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'mrk21/yaml-vim'
"NeoBundle 'elzr/vim-json'
NeoBundle 'honza/vim-snippets'
NeoBundle 'ihacklog/HiCursorWords'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'ternjs/tern_for_vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'scrooloose/syntastic'
NeoBundle 'w0rp/ale'
" NeoBundle 'Quramy/tsuquyomi'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'yegappan/mru'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
NeoBundle 'tomasr/molokai'
NeoBundle 'jeetsukumaran/vim-indentwise'
NeoBundle 'mxw/vim-jsx'
" NeoBundle 'Shougo/vimproc.vim', {
			" \ 'build' : {
			" \     'windows' : 'tools\\update-dll-mingw',
			" \     'cygwin' : 'make -f make_cygwin.mak',
			" \     'mac' : 'make',
			" \     'linux' : 'make',
			" \     'unix' : 'gmake',
			" \    },
			" \ }
if has("mac")
	NeoBundle 'airblade/vim-gitgutter' "creates new window on Win OS, annoying only use on Mac
	NeoBundle 'rizzatti/dash.vim' " Require mac only app dash
endif

call neobundle#end()
" Required:
filetype plugin indent on

" If you prefer the scheme to match the original monokai background color, put this in your .vimrc file:
let g:molokai_original = 1
colorscheme molokai

"------------- Key Mappings --------------------
map <F1> :NERDTreeToggle<CR>
map <leader>nt :NERDTreeToggle<CR>
nmap <F2> :TagbarToggle<CR>
nmap <leader>tb :TagbarToggle<CR>
map <leader>fj :%!python -m json.tool<CR>
map <leader>fx :% !xmllint --format -<CR>
map <leader>nr :NERDTree root<CR>
map <f12> :TernDef<cr>
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

" Call eslint to fix errors, can be removed if ALEFix works properly
" nnoremap <leader><leader>f :silent !npm-run eslint --fix %:p<cr>

  " Bind F8 to fixing problems with ALE
  nmap <F8> <Plug>(ale_fix)

" change single line html to multiple lines
imap <c-y><c-y> <c-y>,<c-c>^lma:s/>/>\r/g<cr>`a=%

" remove file extension and semicolon at the end of line
inoremap <c-y>f <c-c>:s/\.\w*'/'<cr>A;<c-c>

" add semicolon to the end of the block
inoremap <c-y>; <c-c>/[\]})]<cr>A;

inoremap <leader>; <c-c>A;<c-c>hi

nnoremap <leader>tr A,<cr><c-c>i"<c-r>0": "<c-r>-"<c-c>==:s/ "$/"/e<cr>
nmap <leader>tt gUiwyiwf>ldit<c-h>,tr<c-l>
nmap <leader>ct yit<c-h>^3f"Pj<c-l>
nmap <leader>at ^/translate<cr>2f"byw<c-h>A,<cr>"<c-r>0": ""<c-c>i
" Remove text inside tag, add it to json
nmap <leader>rt dit<c-h>^3f""-P<c-c>/: "<cr><c-l>/translate<cr>
" copy line, add it to json
nmap <leader>dt ^d$<c-h>pn<c-l>j

autocmd FileType javascript,css nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
autocmd FileType javascript,css imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)
"------------- Key Mappings --------------------
"To support custom tag
let g:html_indent_tags='\w\+'

" For NerdTree
let NERDChristmasTree=1
let NERDTreeMouseMode=2

" For nerdcommenter
let NERDSpaceDelims=1

" For easymotion
let g:EasyMotion_do_mapping = 1

" For tagbar
let b:tagbar_ignore = 1
let g:tagbar_compact = 1
let g:tagbar_autofocus = 1
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }


" For ctrlp
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_by_filename = 1


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
set dir=~/vimswap/
" set default pwd
" --------------- Project specific ----------------------
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:delimitMate_expand_cr = 2

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_user_command = {
    \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
    \ 'fallback': 'ag %s -l --nocolor -g ""'
    \ }
endif


augroup myGroup
	autocmd!
	autocmd BufNewFile,BufRead *.less set filetype=less
	autocmd BufNewFile,BufRead *.less set syntax=less
	autocmd BufWritePost vimrc so $MYVIMRC
augroup END


" For Ag
" let g:ag_prg="ag --column --smart-case --hidden --ignore='*.min.*'"
let g:ag_prg="ag --path-to-agignore 'C:/Users/ezluoxi/.agignore' --column --smart-case --vimgrep"
let g:ag_highlight=1

" let g:syntastic_typescript_checkers = ['tslint']
" let g:syntastic_javascript_checkers = ['eslint']
" " Disable html checking
" let g:syntastic_html_checkers = []

" For nerdtree-tabs
let g:nerdtree_tabs_open_on_new_tab = 0
let g:nerdtree_tabs_open_on_gui_startup = 0

" camelcasemotion
call camelcasemotion#CreateMotionMappings(',')

"devicons requires
let g:airline_powerline_fonts = 1

let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

"Highlight full name (not only icons). You need to add this if you don't have vim-devicons and want highlight.
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeIgnore=['\.spec\.ts$']

" For Colorizer
let g:colorizer_auto_color=0
let g:colorizer_auto_filetype='css,scss'

" For youcompleteme
" let g:ycm_key_invoke_completion = '<M-Space>'
if has('win32')
	let g:ycm_key_invoke_completion = '<A-Space>'
endif

" For ale
let g:ale_linters = {'javascript': ['eslint']}
" let g:ale_fixers = {
" \   'javascript': [
" \       'eslint',
" \   ],
" \}
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']

" For vim-jsx
let g:jsx_ext_required = 0 " The project uses js as the extension

