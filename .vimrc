" 初期化 =======================================================================
" vi互換にしない
set nocompatible

" win32/64のときtrueを返す
function! s:is_win()
	return (has('win32') || has('win64'))
endfunction

" neobundleの設定 ==============================================================
filetype plugin indent off
if has('vim_starting')
	set runtimepath+=~/.vim/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle/'))
endif
filetype plugin indent on

NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'

NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'git://github.com/scrooloose/nerdcommenter.git'

NeoBundle 'git://github.com/vim-scripts/buftabs.git'

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
if s:is_win()
	set directory=$HOME/vimfiles/swap
else
	set directory=$HOME/.vim/swap
endif

" 基本機能 =====================================================================
" 全角文字を半角倍幅で表示する
set ambiwidth=double
" ファイルが外部で変更されたときは読み直す
set autoread
" 改行時にコメントアウト記号を自動挿入しない
set formatoptions-=ro
" バッファの編集を保持したまま、別バッファの展開を可能にする
set hidden
" コマンドと検索パターンの履歴数
set history=1000
" コマンド実行中に再描画しない
set lazyredraw
" 自動改行しない
set textwidth=0
" 高速ターミナル接続する
set ttyfast
" コマンド確定時間
set timeout
set timeoutlen=1000

" クリップボードをwindowsと共有する
if s:is_win()
	set clipboard=unnamed
endif

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
set statusline=%F%m%r%h%w\%=%{'['.&ff.'/'.(&fenc!=''?&fenc:&enc).']'}[%3l,%3c]
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
	autocmd BufNewFile,BufRead *.css setl shiftwidth=2 tabstop=2
	autocmd BufNewFile,BufRead *.js  setl shiftwidth=2 tabstop=2
	autocmd BufNewFile,BufRead *.rb  setl expandtab shiftwidth=2 tabstop=2
augroup END

" GUI ==========================================================================
if has('gui_running')
	" ウィンドウサイズ
	set lines=40 columns=120
	" フォント
	set guifont=M+2VM+IPAG_circle:h10.8,MS_Gothic:h10.8
	" クリップボードを共有する
	set guioptions+=a
	" メニューバーを表示しない
	set guioptions-=m
	" ツールバーを表示しない
	set guioptions-=T
	" カーソルの点滅時間
	set guicursor=a:blinkwait1000-blinkoff600-blinkon600
	" vimのguiメニューをutf-8に対応させる
	source $VIMRUNTIME/delmenu.vim
	set langmenu=menu_ja_jp.utf-8.vim
	source $VIMRUNTIME/menu.vim
	" 半透明化
	gui
	set transparency=235
endif

" Kaoriya ======================================================================
if has('kaoriya')
	augroup MyKaoriya
		autocmd!
		" 改行時にコメントアウト記号を自動挿入しない
		autocmd FileType * setl formatoptions-=ro
		" 自動改行しない
		autocmd FileType * setl textwidth=0
	augroup END
endif

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

" 分割画面間移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 前のバッファに移動する
nnoremap <F9>  :<C-u>bp<CR>
" 次のバッファに移動する
nnoremap <F10> :<C-u>bn<CR>

" 検索結果ハイライトを消去する
nnoremap <ESC><ESC> :<C-u>noh<CR>

" vimgrep
"nnoremap <LEADER>g :<C-u>vimgrep //j **/*.php \| cw<C-b><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT>

" Insert -----------------------------------------------------------------------
inoremap jj <ESC>
inoremap <C-b> <LEFT>
inoremap <C-f> <RIGHT>

" Command ----------------------------------------------------------------------
cnoremap jj <ESC>
cnoremap <C-b> <LEFT>
cnoremap <C-f> <RIGHT>

" プラグイン ===================================================================
" buftabs ----------------------------------------------------------------------
" ファイル名のみ表示する
let g:buftabs_only_basename = 1
" ステータスラインに表示する
let g:buftabs_in_statusline = 1
" カレントバッファのハイライトグループを設定する
let g:buftabs_active_highlight_group = 'directory'

" 再描写関数
function! s:buftabs_redraw()
	let w:original_statusline = matchstr(&statusline, '%=.*')	" ユーザ指定のステータスラインを格納する
	call Buftabs_enable()										" 描写できるようにする
	call Buftabs_show(-1)										" 描写する
endfunction
command! MyBuftabsRedraw call s:buftabs_redraw()

nnoremap <F8> :<C-u>MyBuftabsRedraw<CR>

" nerd_commenter ---------------------------------------------------------------
" デフォルトマッピングを初期化
let g:NERDCreateDefaultMappings = 0
" コメントアウト時のスペース数
let NERDSpaceDelims = 1

nmap <LEADER>c <plug>NERDCommenterToggle
vmap <LEADER>c <plug>NERDCommenterToggle

" neocomplcache ----------------------------------------------------------------
" 自動起動する
let g:neocomplcache_enable_at_startup = 1
" アンダースコア区切り補完有効
let g:neocomplcache_enable_underbar_completion = 1
" シンタックスキャッシュ時の最短文字列長
let g:neocomplcache_min_syntax_length = 3

" omni補完
inoremap <expr><C-x><C-o> &filetype == 'vim' ? "\<C-x><C-v><C-p>" : neocomplcache#manual_omni_complete()

" nerd_tree --------------------------------------------------------------------
" カラー表示する
let g:NERDChristmasTree  = 1
" 隠しファイルを表示する
let g:NERDTreeShowHidden = 1

" ファイラ表示切替
nnoremap <LEADER>f :<C-u>NERDTreeToggle<CR>

" unite ------------------------------------------------------------------------
" インサートモードで起動する
let g:unite_enable_start_insert = 1
" 最近使用したファイルの記憶上限
let g:unite_source_file_mru_limit = 1000
" grepの候補上限
let g:unite_source_grep_max_candidates = 1000
" yank履歴有効
let g:unite_source_history_yank_enable = 1
" yank履歴の記憶上限
let g:unite_source_history_yank_limit = 1000

" ファイル一覧 (vim起動ディレクトリから)
nnoremap <LEADER>uu :<C-u>Unite file_rec/async -buffer-name=file<CR>
" 最近使用したファイル一覧
nnoremap <LEADER>uh :<C-u>Unite file_mru -buffer-name=file<CR>
" grep
nnoremap <LEADER>ug :<C-u>Unite grep -no-quit<CR>
" yank履歴
nnoremap <LEADER>uy :<C-u>Unite history/yank<CR>

" vimshell ---------------------------------------------------------------------
" ディレクトリ補完時にスラッシュを補う
let g:vimshell_enable_auto_slash = 1
" 履歴数
let g:vimshell_max_command_history = 1000

nnoremap <LEADER>ss :<C-u>VimShell<CR>
nnoremap <LEADER>sc :<C-u>VimShellCreate<CR>

" 自作関数 =====================================================================
" 構文チェック -----------------------------------------------------------------
function! s:php_lint()
	let l:result = system(&ft . ' -l ' . expand('%:p'))

	if 'No syntax errors' == strpart(l:result, 0, 16)
		" エラーなしのとき、メッセージを省略する
		let l:result = 'No syntax errors'
	endif

	echo l:result
endfunction
command! MyPhpLint call s:php_lint()

function! s:ruby_lint()
	echo system(&ft . ' -c ' . expand('%:p'))
endfunction
command! MyRubyLint call s:ruby_lint()

augroup MyLint
	autocmd!
	autocmd BufNewFile,BufRead *.php nnoremap <buffer> ,l :<C-u>MyPhpLint<CR>
	autocmd BufNewFile,BufRead *.rb  nnoremap <buffer> ,l :<C-u>MyRubyLint<CR>
augroup END

" 分割画面保持バッファクローズ -------------------------------------------------
function! s:close_buffer()
	let l:curr_buf = bufnr('%')	" カレントバッファの番号

	if buflisted(bufnr('#'))
		buf #	" 直前まで編集していたバッファに移動する
	else
		bn		" 次のバッファに移動する
	endif

	if bufnr('%') == l:curr_buf
		" カレントバッファしかないとき
		new
	endif

	" バッファを削除する
	exe 'bd ' . l:curr_buf
	if 0 != bufloaded(l:curr_buf)
		" バッファ削除に失敗したとき
		exe 'buf ' . l:curr_buf
	endif
endfunction
command! MyCloseBuffer call s:close_buffer()

nnoremap <F7> :<C-u>MyCloseBuffer<CR>

" 区切りコメント ---------------------------------------------------------------
function! s:separate_comment(sign, count)
	exe 'normal! $a' . repeat(a:sign, a:count - strdisplaywidth(getline('.')))
endfunction
command! MySeparateCommentH call s:separate_comment('-', 80)
command! MySeparateCommentE call s:separate_comment('=', 80)

nnoremap <leader>- :<C-u>MySeparateCommentH<CR>
nnoremap <leader>= :<C-u>MySeparateCommentE<CR>

" 変換子 -----------------------------------------------------------------------
" p : フルパス, h : ディレクトリ, t : ファイル名, r : 拡張子なし, e : 拡張子のみ
