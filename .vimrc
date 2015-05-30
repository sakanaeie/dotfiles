" 初期化 =======================================================================
" vi互換にしない
set nocompatible

" neobundleの設定 ==============================================================
filetype plugin indent off
if has('vim_starting')
	set runtimepath+=~/.vim/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle/'))
endif
filetype plugin indent on

NeoBundle 'git://github.com/Shougo/vimproc.git', {
\	'build': {
\		'mac':  'make -f make_mac.mak',
\		'unix': 'make -f make_unix.mak',
\	},
\}

NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/unite.vim'
" TODO neocompleteに置き換え
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neomru.vim'

NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'

NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'git://github.com/scrooloose/syntastic.git'

NeoBundle 'git://github.com/h1mesuke/vim-alignta.git'

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
set listchars=tab:>-,trail:_,extends:<,precedes:>

" ターミナルのカラー化
if has('unix')
	set ttytype=builtin_linux
	set term=builtin_linux
	set t_Co=256
endif

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
set timeoutlen=1000

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
set statusline=%F%m%r%h%w%=[%{&ff.','.(&fenc!=''?&fenc:&enc).','.&ft}]\ [%3l,%3c]\ (╹◡╹๑)
" 広告を表示しない
set shortmess+=I
" スクロール時も表示が維持される行数
set scrolloff=4
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
" タブを使用する
set noexpandtab
" オートインデント有効
set autoindent
" 高度なオートインデント有効
set smartindent
" 行頭では[shiftwidth]、それ以外では[tabstop]の数を適用
set smarttab
" インデントが対応する半角文字数
set shiftwidth=4
" タブが対応する半角文字数
set tabstop=4

" 特定の拡張子ファイルのみインデント設定を変更
augroup MyExtensionIndent
	autocmd!
"	autocmd BufNewFile,BufRead *.css setl shiftwidth=2 tabstop=2
"	autocmd BufNewFile,BufRead *.js  setl shiftwidth=2 tabstop=2
	autocmd BufNewFile,BufRead *.rb  setl expandtab shiftwidth=2 tabstop=2
augroup END

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

" 多め移動
" TODO 使わないので有意義な利用法を探す
nnoremap <C-j> gjgjgjgjzz
nnoremap <C-k> gkgkgkgkzz

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
nnoremap <LEADER>t :<C-u>tabnew<CR>

" タブ間移動
nnoremap <C-h> gt
nnoremap <C-l> gT

" 行末までヤンク
nnoremap Y y$

" 検索結果ハイライトを消す
nnoremap <ESC><ESC> :<C-u>noh<CR>

" ctags
nnoremap <RETURN> g<C-]>
nnoremap <BS> <C-t>

" ペーストモード切り替え
set pastetoggle=<F12>

" Insert -----------------------------------------------------------------------
inoremap jj <ESC>
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

" プラグイン ===================================================================
" vimshell ---------------------------------------------------------------------
" ディレクトリ補完時にスラッシュを補う
let g:vimshell_enable_auto_slash = 1
" 履歴数
let g:vimshell_max_command_history = 1000

nnoremap <LEADER>ss :<C-u>VimShell<CR>
nnoremap <LEADER>sc :<C-u>VimShellCreate<CR>
nnoremap <LEADER>st :<C-u>VimShellTab<CR>

" unite ------------------------------------------------------------------------
" インサートモードで起動する
let g:unite_enable_start_insert = 1
" 最近使用したファイルの記憶上限
let g:unite_source_file_mru_limit = 1000
" セッション保存
let g:unite_source_session_enable_auto_save = 1

" grepの候補上限
let g:unite_source_grep_max_candidates = 1000
" grepのオプション
let g:unite_source_grep_default_opts = '-Hni'

" yank履歴有効
let g:unite_source_history_yank_enable = 1
" yank履歴の記憶上限
let g:unite_source_history_yank_limit = 1000

" ファイル一覧 (vim起動ディレクトリから)
nnoremap <LEADER>uu :<C-u>Unite file_rec/async -buffer-name=file<CR>
" バッファ一覧
nnoremap <LEADER>ub :<C-u>Unite buffer -buffer-name=file<CR>
" タブ一覧
nnoremap <LEADER>ut :<C-u>Unite tab<CR>
" 最近使用したファイル一覧
nnoremap <LEADER>uh :<C-u>Unite file_mru -buffer-name=file<CR>
" grep
nnoremap <LEADER>ug :<C-u>Unite grep -no-quit<CR><BS>**/*.
" yank履歴
nnoremap <LEADER>uy :<C-u>Unite history/yank<CR>

" neocomplcache ----------------------------------------------------------------
" TODO neocompleteに置き換え
" 自動起動する
let g:neocomplcache_enable_at_startup = 1
" アンダースコア区切り補完有効
let g:neocomplcache_enable_underbar_completion = 1
" シンタックスキャッシュ時の最短文字列長
let g:neocomplcache_min_syntax_length = 3

" vim-ref ----------------------------------------------------------------------
" phpmanual
let g:ref_phpmanual_path = $HOME . '/dotfiles/.vim/phpmanual/'
nnoremap <LEADER>rp :<C-u>Ref phpmanual<SPACE>

" quickrun ---------------------------------------------------------------------
" 詳細設定
let g:quickrun_config = {
\	'_': {
\		'runner': 'vimproc',
\		'runner/vimproc/updatetime': 10,
\		'outputter/buffer/split': ':botright',
\		'outputter/buffer/close_on_empty': 1,
\		'hook/time/enable': 1,
\	}
\}

" nerdtree ---------------------------------------------------------------------
" カラー表示する
let g:NERDChristmasTree  = 1
" 隠しファイルを表示する
let g:NERDTreeShowHidden = 1

" ファイラ表示切替
nnoremap <silent> <LEADER>f :<C-u>NERDTreeToggle<CR>

" syntastic --------------------------------------------------------------------
" モード設定
let g:syntastic_mode_map = {
\	'mode': 'passive',
\	'active_filetypes': ['php', 'ruby', 'javascript'],
\	'passive_filetypes': [],
\}

" jsの構文チェックは、jslintでなくjshintを利用する
let g:syntastic_javascript_checkers = ['jshint']

" 手動呼び出し
nnoremap <LEADER>l :<C-u>SyntasticCheck<CR>

" alignta ----------------------------------------------------------------------
" 簡易呼び出し
xnoremap a ::Alignta<SPACE>
" 連想配列向け
nnoremap <LEADER>a vi[::Alignta =><CR>

" 自作関数 =====================================================================
" 分割画面保持バッファクローズ -------------------------------------------------
function! s:closeBuffer()
	let l:cur_buf = bufnr('%')	" カレントバッファの番号

	if buflisted(bufnr('#'))
		buf #	" 直前まで編集していたバッファに移動する
	else
		bn		" 次のバッファに移動する
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
