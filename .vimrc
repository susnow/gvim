if has('win32')
  let g:loaded_lustyjuggler = 1
  let g:loaded_gist_vim = 1
endif

if has('zsh-beta') " debian, in case
    set shell='zsh-beta'
elseif has('zsh')
    set shell='zsh'
endif

call pathogen#runtime_append_all_bundles()

let mapleader=","
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup nowb nowritebackup nocp
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobomb
"set encoding=utf-8
set fileformat=unix
set fileformats=unix,mac,dos
set fileencodings=ucs-bom,utf-8,cp936,gbk,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8

set completeopt=longest,menu

set hlsearch
set incsearch
set autoindent smartindent cindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set backspace=indent,eol,start
set history=200
set magic ruler

set nu!
set wrap nolinebreak
set ai!
set et!
set diffopt=filler,vertical
set scrolloff=6

filetype plugin on
filetype indent on

syntax enable
set showmatch
set cmdheight=2
set showcmd

set cursorline
set cursorcolumn

" Status line
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L:%c:

set wc=<tab>
set wildmenu
set wildmode=longest:full

set foldenable
set foldmethod=marker
set foldmarker={{{,}}}
set foldnestmax=5
set foldminlines=1
set foldlevel=0

if has("gui_running")
  colo tir_black 
  set guioptions= 

  if has('win32') 
    set guifont=Consolas:h10:cANSI
    set lines=40
    set columns=130
  else
	set guifont=DejaVu\ Sans\ Mono:h13
    set guifontwide=WenQuanYi\ Micro\ Hei\ Mono:h13
    "set guifont=Monospace:h7:w3
    set lines=40
    set columns=130
  endif
else
  colo lucius
endif

"set list
"set listchars=tab:\ \,trail:¤
hi SpecialKey guibg=NONE ctermbg=NONE
"hi line luaOperator Conditional

au FileType javascript setl nocindent

set tags='/usr/local/bin/ctags'
if executable('ctags')
endif

" NERDTree toggle
nnoremap <F11> :NERDTreeToggle<CR>
" taglist
nnoremap <F12> :TlistToggle<CR>

" tab control
"map <F7> :tabnew<CR>
"map <F8> :tabclose<CR>
map <F9> :tabprevious<CR>
map <F10> :tabnext<CR>

" no suppress for not having ruby
let g:LustyExplorerSuppressRubyWarning = 1
let g:LustyJugglerSuppressRubyWarning = 1

"Sets default exclude pattern:
let g:DirDiffExcludes = "CVS,*.git,*.svn,*.class,*.exe,.*.swp"
"Sets default ignore pattern:
let g:DirDiffIgnore = "Id:,Revision:,Date:"
"If DirDiffSort is set to 1, sorts the diff lines.
let g:DirDiffSort = 1
"Sets the diff window (bottom window) height (rows)
let g:DirDiffWindowSize = 10
"Ignore case during diff
let g:DirDiffIgnoreCase = 0

let loaded_minibufexplorer=1

let g:gist_open_browser_after_post = 1

" indent
autocmd FileType html let b:did_indent = 1

" Disable AutoComplPop. 
let g:acp_enableAtStartup = 0 
" Use neocomplcache. 
let g:neocomplcache_enable_at_startup = 1 
" Use smartcase. 
let g:neocomplcache_enable_smart_case = 1 
" Use camel case completion. 
let g:neocomplcache_enable_camel_case_completion = 1 
" Use underbar completion. 
let g:neocomplcache_enable_underbar_completion = 1 
" Set minimum syntax keyword length. 
let g:neocomplcache_min_syntax_length = 3 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*' 

" Define dictionary. 
let g:neocomplcache_dictionary_filetype_lists = { 
    \ 'default' : '', 
    \ }
"    \ 'php' : 'c:\tags',
"    \ 'vimshell' : $HOME.'/.vimshell_hist', 
"   \ 'scheme' : $HOME.'/.gosh_completions' 
"    \ } 

" Define keyword. 
if !exists('g:neocomplcache_keyword_patterns') 
    let g:neocomplcache_keyword_patterns = {} 
endif 
let g:neocomplcache_keyword_patterns['default'] = '\h\w*' 

" Plugin key-mappings. 
imap <C-k>     <Plug>(neocomplcache_snippets_expand) 
smap <C-k>     <Plug>(neocomplcache_snippets_expand) 
inoremap <expr><C-g>     neocomplcache#undo_completion() 
inoremap <expr><C-l>     neocomplcache#complete_common_string() 

" Recommended key-mappings. 
" <CR>: close popup and save indent. 
" inoremap <expr><CR>  (pumvisible() ? "\<C-y>":'') . "\<C-f>\<CR>X\<BS>" 
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion. 
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
" <C-h>, <BS>: close popup and delete backword char. 
inoremap <expr><C-h> pumvisible() ? neocomplcache#close_popup()."\<C-h>" : "\<C-h>" 
inoremap <expr><BS> pumvisible() ? neocomplcache#close_popup()."\<C-h>" : "\<C-h>" 
inoremap <expr><C-y>  neocomplcache#close_popup() 
inoremap <expr><C-e>  neocomplcache#cancel_popup() 

" AutoComplPop like behavior. 
"let g:neocomplcache_enable_auto_select = 1 
"inoremap <expr><CR>  (pumvisible() ? "\<C-e>":'') . (&indentexpr != '' ? "\<C-f>\<CR>X\<BS>":"\<CR>") 
"inoremap <expr><C-h> pumvisible() ? neocomplcache#cancel_popup()."\<C-h>" : "\<C-h>" 
"inoremap <expr><BS> pumvisible() ? neocomplcache#cancel_popup()."\<C-h>" : "\<C-h>"


" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
