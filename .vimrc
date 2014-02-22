colorscheme torte

set hlsearch
set number
set ruler
set ignorecase
set smartcase
set hidden
set showcmd
set wildmenu
set noswapfile
set expandtab

" Allow backspacing over autoindent, line breaks and start of insert action
" オートインデント、改行、インサートモード開始直後にバックスペースキーで
" 削除できるようにする。
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
" オートインデント
set tabstop=2
set shiftwidth=2
set expandtab

" Always display the status line, even if only one window is displayed
set laststatus=2

filetype plugin indent on

" 行末の見えない文字を見えるようにする
set list
set listchars=tab:>-,trail:_

" 保存時に行末の空白を除去する
"autocmd BufWritePre * :%s/\s\+$//ge

"Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
set cmdheight=2

" よく使う文字列の自動補完
iab u8 # -*- coding: utf-8 -*-

" Powerlineの見た目
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'relative'

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
if has('lua')
  NeoBundle 'Shougo/neocomplete'
endif

NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
NeoBundle 'basyura/unite-rails'
NeoBundle 'Lokaltog/vim-powerline'

NeoBundleCheck

if has('lua')
  "==========================================
  "neocomplete.vim
  "==========================================
  "use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#force_overwrite_completefunc = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1

  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#auto_completion_start_length = 2
  let g:neocomplete#manual_completion_start_length = 0
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#min_keyword_length = 2
  let g:neocomplete#lock_buffer_name_pattern = '\.log\|\.log\.\|.*quickrun.*\|.jax'
  let g:neocomplete#sources#buffer#disabled_pattern = '\.log\|\.log\.\|\.jax'

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Enable omni input patters
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

  " Plugin key-mappings.
  inoremap <expr><C-l> neocomplete#complete_common_string()

  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    "return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y> neocomplete#close_popup()
endif

syntax on
