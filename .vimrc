"""
""" 環境依存する設定
"""
" 文字コード関連の設定
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932
set fileencoding=utf-8
"set encoding=utf-8

"" カラースキームの設定
colorscheme zellner
"colorscheme ron
"colorscheme torte



"""
"""  共通の設定
"""
syntax on
set list
set nrformats-=octal
set hlsearch
set shiftwidth=4
set tabstop=4
set nobackup
set ai
set matchpairs=(:),{:},[:],<:>
set pastetoggle=<Insert>
set expandtab

" ステータスラインの設定
set cmdheight=1
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P



" タグジャンプ(C-])をg<C-]>に変更
nmap <C-]> g<C-]>
" Ctrl-L で検索ハイライトを消す
nmap <C-l> <C-l>:nohlsearch<CR>



" iconvを使用して文字コード変換を行う
" iconv.dllを使用する場合EUCの場合だけ正しく認識しないことがある
cabbrev iconv_es %!iconv -f euc-jp -t cp932
cabbrev iconv_se %!iconv -f cp932 -t euc-jp

" 文字コード指定でファイルを保存
cabbrev ws set fenc=cp932<CR>:w
cabbrev we set fenc=euc-jisx0213<CR>:w
cabbrev wj set fenc=iso-2022-jp-3<CR>:w
cabbrev wu set fenc=utf-8<CR>:w

" 文字コード指定でファイルを開く
cabbrev es e ++enc=cp932
cabbrev ee e ++enc=euc-jisx0213
cabbrev ej e ++enc=iso-2022-jp-3
cabbrev eu e ++enc=utf-8


" highlight関連の設定は設定ファイルの最後に記述しないとうまく機能しなかった
" またwindowsでは全角スペース(　)はcp932で記述しないとうまく機能しない
highlight ZenkakuSpace cterm=reverse gui=reverse
match ZenkakuSpace /　/

" tab表記の設定				
" コピペに影響しない様にtabはスペースで、アンダーラインは効果で表示する
" (terminal emulator対策)
set listchars=tab:\ \ 
highlight SpecialKey cterm=underline gui=underline
autocmd Filetype css :set omnifunc=csscomplete#CompleteCSS
set iminsert=0

" NEO BUNDLE
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'
" Original repos on github
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'rails.vim'
NeoBundle 'local_vimrc.vim'
NeoBundle 'groenewege/vim-less'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

