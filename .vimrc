syntax enable

" NeoBundle --------------------------------------------------------------------
if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" 補完
" neocomplete うまく行かなかったのでこのままで
NeoBundle 'Shougo/neocomplcache'

" ツリー表示
NeoBundle 'scrooloose/nerdtree'

" バッファ一覧をタブ表示
NeoBundle 'buftabs'

" インデントに色を付ける
NeoBundle 'nathanaelkane/vim-indent-guides'

" 複数行コメントアウト
NeoBundle 'tomtom/tcomment_vim'

" ctags
NeoBundle 'szw/vim-tags'

" Ruby
NeoBundle 'tpope/vim-endwise'

" emmet
NeoBundle 'mattn/emmet-vim'

" syntax
NeoBundle 'othree/html5.vim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'vim-javascript'
NeoBundle 'groenewege/vim-less'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'posva/vim-vue'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'motus/pig.vim'

" colorscheme
NeoBundle 'tomasr/molokai'

" editorconfig
NeoBundle 'editorconfig/editorconfig-vim'

" syntax check
NeoBundle 'scrooloose/syntastic'
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" charset ----------------------------------------------------------------------
set encoding=utf-8
if has('autocmd')
    function! AU_ReCheck_FENC()
        if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
            let &fileencoding=&encoding
        endif
    endfunction
    autocmd BufReadPost * call AU_ReCheck_FENC()
endif
set fileformats=unix,dos,mac
if exists('&ambiwidth')
    set ambiwidth=double
endif

" display ----------------------------------------------------------------------
set number       " 行番号
set ruler        " カーソル位置の行数を表示
set showmode     " モード表示
set nofoldenable " 折りたたみ無し

" 不可視文字
set list
set listchars=tab:>-,extends:<,trail:-,eol:↵

set showmatch

" status -----------------------------------------------------------------------
" コマンド行表示
set showcmd
set cmdheight=1

" ステータス表示
set laststatus=2
set statusline=%F\%9(\ %m%r\ %)\ %=[%{&fileencoding}]\ %11(%l/%L%)\ [%3(%c%)]

" editor -----------------------------------------------------------------------
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

" スクロール時に余裕をもたせる
set scrolloff=5

" バッファ保存無し切り替え
set hidden

" 更新されたら再読み込み
set autoread

" バックアップ系無効
set nobackup
set noswapfile

set whichwrap=b,s,h,l,<,>,[,]
set nostartofline

set shellslash
set wildmenu wildmode=list:longest,full

" backspaceで何でも消す
set backspace=indent,eol,start

" sudoし忘れたとき
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

" search -----------------------------------------------------------------------
set noignorecase
set smartcase
set hlsearch
set incsearch
set history=50

" sound ------------------------------------------------------------------------
set t_vb=
set visualbell
set noerrorbells

" color ------------------------------------------------------------------------
colorscheme molokai
set t_Co=256
highlight Normal ctermbg=none
highlight Comment ctermfg=Green

" [plugin] neocomplcache -------------------------------------------------------
" 自動起動
let g:neocomplcache_enable_at_startup = 1

" 大文字入力されるまで大文字小文字区別しない
let g:neocomplcache_enable_smart_case = 1

" ABC -> A*B*C
let g:neocomplcache_enable_camel_case_completion = 0
" A_B_C -> A*B*C
let g:neocomplcache_enable_underbar_completion = 1

" 最小の長さ
let g:neocomplcache_min_syntax_length = 3


" タブで候補選択" タブで候補選択
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"

" 色
highlight Pmenu ctermbg=8 guibg=#606060

" [plugin] buftabs -------------------------------------------------------------
" ファイル名だけにする
let g:buftabs_only_basename = 1

" ステータス行に表示
let g:buftabs_in_statusline = 1

" [plugin] indent_guides -------------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234

" [plugin] jsx -----------------------------------------------------------------
let g:jsx_ext_required = 0

" [lang] Ruby ------------------------------------------------------------------
au BufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2

" [lang] CSS -------------------------------------------------------------------
au BufNewFile,BufRead *.scss set filetype=scss

" key --------------------------------------------------------------------------
set pastetoggle=<F12>
noremap <F11> <ESC>:NERDTreeToggle<CR>
noremap <Space> <ESC>:bnext<CR>

nmap <Up> gk
nmap <Down> gj
nmap k gk
nmap j gj

" local ------------------------------------------------------------------------
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif

