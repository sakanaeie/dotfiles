" 初期化 =======================================================================
" vi互換にしない
set nocompatible

" ファイル属性 =================================================================
" 文字エンコード
set encoding=utf-8
" 文字エンコードの認識優先度
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16,utf-16le
" 改行コード
set fileformat=unix
" 改行コードの認識優先度
set fileformats=unix,dos,mac

" 文字色と可視化 ===============================================================
" 全角スペースの可視化
scriptencoding utf-8
augroup MyHighlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=white guibg=white
  autocmd VimEnter,WinEnter,BufNewFile,BufRead * match IdeographicSpace /　/
augroup END

" 不可視文字の表示
set list
set listchars=tab:\|.,trail:_,extends:<,precedes:>

" カラースキーマ
colorscheme mycolor256
syntax on

" 自動作成ファイル =============================================================
" バックアップを作成しない
set nobackup
" スワップを作成する
set swapfile
" スワップを作成するディレクトリ
set directory=$HOME/.vim/swap

augroup MyMacCrontab
  autocmd!
  " crontabで発生するいざこざを回避する
  autocmd BufRead /private/tmp/crontab.* set backupcopy=yes
augroup END

" 基本機能 =====================================================================
" 全角文字を半角倍幅で表示する
set ambiwidth=double
" ファイルが外部で変更されたときは読み直す
set autoread
" バッファの編集を保持したまま、別バッファの展開を可能にする
set hidden
" コマンドと検索パターンの履歴数
set history=1000
" コマンド実行中に再描画しない
set lazyredraw
" 高速ターミナル接続する
set ttyfast
" コマンド確定時間
set timeout
set timeoutlen=500

" 上書きされがちな設定
augroup MyAutoCommand
  autocmd!
  " 改行時にコメントアウト記号を自動挿入しない
  autocmd BufNewFile,BufRead * set formatoptions-=ro
  " 自動改行しない
  autocmd BufNewFile,BufRead * set textwidth=0
augroup END

" 操作性 =======================================================================
" バックスペースを有効にする
set backspace=indent,eol,start
" [%]で移動する対応括弧
set matchpairs=(:),{:},[:],<:>
" カーソルを行頭末で停止させない
set whichwrap=h,l

" 表示 =========================================================================
" 行番号を表示する
set number
" コマンドライン縦幅
set cmdheight=2
" ステータスライン位置
set laststatus=2
" ステータスライン表示情報
set statusline=%F%m%r%h%w%=[%{&ff.','.(&fenc!=''?&fenc:&enc).','.&ft}]\ [%3l,%3c]
" 広告を表示しない
set shortmess+=I
" スクロール時も表示が維持される行数
set scrolloff=2
" コマンドを表示する
set showcmd
" 対応括弧を表示する
set showmatch
" モードを表示する
set showmode
" タイトルを表示する
set title

" 検索 =========================================================================
" 大小文字を区別しない
set ignorecase
" 小文字で検索した時のみ大小文字を区別しない
set smartcase
" インクリメンタルサーチ有効
set incsearch
" 検索結果ハイライト有効
set hlsearch
" 検索を循環させない
set nowrapscan

" インデント ===================================================================
" タブを使用しない
set expandtab
" オートインデント有効
set autoindent
" 高度なオートインデント有効
set smartindent
" 行頭では[shiftwidth]、それ以外では[tabstop]の数を適用
set smarttab
" インデントが対応する半角文字数
set shiftwidth=2
" タブが対応する半角文字数
set tabstop=2

" 特定の拡張子ファイルのみインデント設定を変更
augroup MyExtensionIndent
  autocmd!
  autocmd FileType eruby setl noexpandtab shiftwidth=4 tabstop=4
  autocmd FileType php   setl noexpandtab shiftwidth=4 tabstop=4
augroup END

" タブUI =======================================================================
" タブラインを表示する
set showtabline=2

" SIDを取得する
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" タブライン表示情報
function! s:myTabLine()
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufs = tabpagebuflist(i)
    let buf  = bufs[tabpagewinnr(i) - 1]

    let s .= '%' . i . 'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
"    let s .= i . ':' . '[' . fnamemodify(bufname(buf), ':t') . ']'
    let s .= i . ':' . '[' . bufname(buf) . ']'
    let s .= getbufvar(buf, '&modified') ? '+ ' : '  '
    let s .= '%#TabLineFill#'
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  let s .= 'current:' . fnamemodify(getcwd(), ':~')
  return s
endfunction
let &tabline = '%!' . s:SID_PREFIX() . 'myTabLine()'

" 言語別 =======================================================================
" php --------------------------------------------------------------------------
" mysqlをハイライトする
let g:sql_type_default='mysql'
let php_sql_query = 1
" htmlをハイライトする
let php_htmlInStrings = 1
" baselib?をハイライトする
let php_baselib = 1

" キーマッピング ===============================================================
" Normal -----------------------------------------------------------------------
" [,]を<LEADER>にする
let mapleader = ','

" [;]と[:]を入れ替える
nnoremap ; :
nnoremap : ;

" 表示行単位移動
nnoremap j gj
nnoremap k gk

" カーソル画面中央固定移動
nnoremap <S-j> gjzz
nnoremap <S-k> gkzz

" 行頭行末
noremap <C-a> 0
noremap <C-e> $

" 画面分割
nnoremap <LEADER>v :<C-u>vsp<CR>

" 分割画面間移動
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

" 分割画面サイズ変更
nnoremap s< <C-w>4<
nnoremap s+ <C-w>+
nnoremap s- <C-w>-
nnoremap s> <C-w>4>

" 新しいタブを開く
nnoremap <LEADER>tt :<C-u>tabnew<CR>

" タブを閉じる
nnoremap <LEADER>tq :<C-u>tabclose<CR>

" タブ間移動
nnoremap <C-h> gt
nnoremap <C-l> gT

" 検索結果ハイライトを消す
nnoremap <ESC><ESC> :<C-u>noh<CR>

" ctags
nnoremap <RETURN> g<C-]>
nnoremap <BS> <C-t>

" ペーストモード切り替え
set pastetoggle=<F12>

" 段落をソートする
nnoremap <LEADER>s vip::sort<CR>

" Insert -----------------------------------------------------------------------
inoremap jj <ESC>
inoremap jk <ESC>
inoremap jl <ESC>
inoremap j; <ESC>
inoremap <C-b> <LEFT>
inoremap <C-f> <RIGHT>
inoremap <C-e> <END>
inoremap <C-a> <HOME>

" Command ----------------------------------------------------------------------
cnoremap <C-b> <LEFT>
cnoremap <C-f> <RIGHT>
cnoremap <C-e> <END>
cnoremap <C-a> <HOME>

" 自作関数 =====================================================================
" 分割画面保持バッファクローズ -------------------------------------------------
function! s:closeBuffer()
  let l:cur_buf = bufnr('%')  " カレントバッファの番号

  if buflisted(bufnr('#'))
    buf # " 直前まで編集していたバッファに移動する
  else
    bn    " 次のバッファに移動する
  endif

  if bufnr('%') == l:cur_buf
    " カレントバッファしかないとき
    new
  endif

  " バッファを削除する
  exe 'bd ' . l:cur_buf
  if 0 != bufloaded(l:cur_buf)
    " バッファ削除に失敗したとき
    exe 'buf ' . l:cur_buf
  endif
endfunction
command! MyCloseBuffer call s:closeBuffer()

nnoremap sd :<C-u>MyCloseBuffer<CR>

" 表示簡素化切り替え -----------------------------------------------------------
function! s:toggleSimpleDisplay()
  if &list
    set nonumber
    set nolist
  else
    set number
    set list
  endif
endfunction
command! MyToggleSimpleDisplay call s:toggleSimpleDisplay()

nnoremap <F11> :<C-u>MyToggleSimpleDisplay<CR>

" 区切りコメント ---------------------------------------------------------------
function! s:separateComment(sign, count)
  exe 'normal! $a' . repeat(a:sign, a:count - strdisplaywidth(getline('.')))
endfunction
command! MySeparateCommentH call s:separateComment('-', 80)
command! MySeparateCommentE call s:separateComment('=', 80)

nnoremap <LEADER>- :<C-u>MySeparateCommentH<CR>
nnoremap <LEADER>= :<C-u>MySeparateCommentE<CR>
