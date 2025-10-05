" Base ----------------------
set nocompatible
filetype plugin indent on

syntax on
set encoding=utf-8
set ambiwidth=double
set fileformats=unix,dos,mac

" Display -------------------
set number
set showmatch
set nofoldenable
set scrolloff=5
set list
set listchars=tab:>-,extends:<,trail:-,eol:↵
if has('termguicolors')
  set termguicolors
endif
set laststatus=2
set statusline=%f\ %m%r%=%{&fileencoding}\ %l/%L\ %c

" Editor --------------------
set hidden
set autoread
set nobackup
set noswapfile
set backspace=indent,eol,start
set wildmenu wildmode=longest:full,full
set whichwrap=b,s,<,>,[,]
set nostartofline
set mouse=a
if has('clipboard')
  set clipboard^=unnamedplus
endif

" search --------------------
set ignorecase
set smartcase
set hlsearch
set incsearch
set history=200

" indent --------------------
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Golang
augroup ft_go
  autocmd!
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
augroup END

" netrw を F11 でトグル
nnoremap <F11> :Lexplore<CR>

" 次バッファを Space で切り替え
nnoremap <Space> :bnext<CR>

" paste モード
set pastetoggle=<F12>

" sudo し忘れたとき
cnoremap w!! w !sudo tee % >/dev/null

" color --------------------
colorscheme desert
hi Normal guibg=NONE ctermbg=NONE

" local --------------------
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif
