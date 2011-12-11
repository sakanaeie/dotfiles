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

NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'

NeoBundle 'git://github.com/scrooloose/nerdtree.git'

NeoBundle 'git://github.com/kana/vim-textobj-user.git'
NeoBundle 'git://github.com/h1mesuke/textobj-wiw.git'

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
set relativenumber
" コマンドライン縦幅
set cmdheight=2
" ステータスライン位置
set laststatus=2
" ステータスライン表示情報
set statusline=%F%m%r%h%w\%=%{'['.&ff.'/'.(&fenc!=''?&fenc:&enc).']'}[%3l,%3c]
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
	autocmd BufNewFile,BufRead *.css setl shiftwidth=2 tabstop=2
	autocmd BufNewFile,BufRead *.js  setl shiftwidth=2 tabstop=2
	autocmd BufNewFile,BufRead *.rb  setl expandtab shiftwidth=2 tabstop=2
augroup END

" 言語別 =======================================================================
" php --------------------------------------------------------------------------
" 文字列中のsqlをハイライト
let php_sql_query = 1
" 文字列中のhtmlをハイライト
let php_htmlInStrings = 1

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

" 画面分割
nnoremap <LEADER>v :<C-u>vsp<CR>

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

" ペーストモード切り替え
set pastetoggle=<F12>

" Insert -----------------------------------------------------------------------
inoremap jj <ESC>
inoremap <C-b> <LEFT>
inoremap <C-f> <RIGHT>

" Command ----------------------------------------------------------------------
cnoremap jj <ESC>
cnoremap <C-b> <LEFT>
cnoremap <C-f> <RIGHT>

" プラグイン ===================================================================
" neocomplcache ----------------------------------------------------------------
" 自動起動する
let g:neocomplcache_enable_at_startup = 1
" アンダースコア区切り補完有効
let g:neocomplcache_enable_underbar_completion = 1
" シンタックスキャッシュ時の最短文字列長
let g:neocomplcache_min_syntax_length = 3

" snippet
let g:neocomplcache_snippets_dir = '~/.vim/snippets'
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

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
" grepのオプション
let g:unite_source_grep_default_opts = '-Hni'

" yank履歴有効
let g:unite_source_history_yank_enable = 1
" yank履歴の記憶上限
let g:unite_source_history_yank_limit = 1000

" ファイル一覧 (vim起動ディレクトリから)
nnoremap <LEADER>uu :<C-u>Unite file_rec/async -buffer-name=file<CR>
" バッファ一覧
nnoremap <LEADER>b :<C-u>Unite buffer -buffer-name=file<CR>
" ブクマ一覧
nnoremap <LEADER>ub :<C-u>Unite bookmark -default-action=cd<CR>
" 最近使用したファイル一覧
nnoremap <LEADER>uh :<C-u>Unite file_mru -buffer-name=file<CR>
" grep
nnoremap <LEADER>g :<C-u>Unite grep -no-quit<CR>/*.
" yank履歴
nnoremap <LEADER>y :<C-u>Unite history/yank<CR>

" vimshell ---------------------------------------------------------------------
" ディレクトリ補完時にスラッシュを補う
let g:vimshell_enable_auto_slash = 1
" 履歴数
let g:vimshell_max_command_history = 1000

nnoremap <LEADER>ss :<C-u>VimShell<CR>
nnoremap <LEADER>sc :<C-u>VimShellCreate<CR>

" textobj ======================================================================
" wiw --------------------------------------------------------------------------
" デフォルトの設定を破棄
let g:textobj_wiw_no_default_key_mappings = 1

nmap w  <Plug>(textobj-wiw-n)
nmap b  <Plug>(textobj-wiw-p)
nmap e  <Plug>(textobj-wiw-N)
nmap ge <Plug>(textobj-wiw-P)
omap aw <Plug>(textobj-wiw-a)
omap iw <Plug>(textobj-wiw-i)

" 自作関数 =====================================================================
" 構文チェック -----------------------------------------------------------------
function! s:phpLint()
	let l:result = system(&ft . ' -l ' . expand('%:p'))

	if 'No syntax errors' == strpart(l:result, 0, 16)
		" エラーなしのとき、メッセージを省略する
		let l:result = 'No syntax errors'
	endif

	echo l:result
endfunction
command! MyPhpLint call s:phpLint()

function! s:rubyLint()
	echo system(&ft . ' -c ' . expand('%:p'))
endfunction
command! MyRubyLint call s:rubyLint()

augroup MyLint
	autocmd!
	autocmd BufNewFile,BufRead *.php nnoremap <buffer> ,l :<C-u>MyPhpLint<CR>
	autocmd BufNewFile,BufRead *.rb  nnoremap <buffer> ,l :<C-u>MyRubyLint<CR>
augroup END

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

nnoremap <F7> :<C-u>MyCloseBuffer<CR>

" 行数表示形式切り替え ---------------------------------------------------------
function! s:toggleNumber()
	if &number
		set nonumber
		set relativenumber
	else
		set norelativenumber
		set number
	endif
endfunction
command! MyToggleNumber call s:toggleNumber()

nnoremap <F8> :<C-u>MyToggleNumber<CR>

" 表示簡素化切り替え -----------------------------------------------------------
function! s:toggleSimpleDisplay()
	if &list
		set nonumber
		set norelativenumber
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

" 一時コメントアウト -----------------------------------------------------------
" コメントアウト記号辞書
let s:commentout_dict = {
	\'css': {'prefix': '/*', 'suffix': '*/'},
	\'html': {'prefix': '<!--', 'suffix': '-->'},
	\'javascript': {'prefix': '//'},
	\'php': {'prefix': '//'},
	\'vim': {'prefix': '"'},
	\'default': {'prefix': '#'},
	\}

"
" 一時コメントアウト切り替え
"
" 取り付け/取り除き処理の切り替え条件は、処理対象の最初の行の行末/行頭がコメントアウトされているかどうかである
" ただし、厳密な意味で'行頭(0)/行末($)'を指す
"
" @param	int		mode	0:NormalMode / 1:VisualMode
"
function! s:toggleTemporaryCommentout(mode)
	" ファイルタイプによる、記号の選定
	if has_key(s:commentout_dict, &filetype)
		" コメントアウト記号辞書にあるとき、それを使用する
		let l:sign_row = s:commentout_dict[&filetype]
	else
		" ないとき、default を利用する
		let l:sign_row= s:commentout_dict['default']
	endif

	" 始端/終端記号の決定
	let l:sign_hash = {}
	for l:side in ['prefix', 'suffix']
		if has_key(l:sign_row, l:side)
			" prefix / suffix が辞書にあるとき
			if 'prefix' == l:side
				" prefix のとき、記号の後にスペースをつける
				let l:sign_hash[l:side] = l:sign_row[l:side] . ' '
			else
				" suffix のとき、記号の前にスペースをつける
				let l:sign_hash[l:side] = ' ' . l:sign_row[l:side]
			endif
		else
			" ないとき
			let l:sign_hash[l:side] = ''
		endif
	endfor

	" Normal / Visual モードによる、処理対象行の決定
	if 0 == a:mode
		" Normalモードのとき
		let l:first_line = line('.')
		let l:last_line  = l:first_line
	else
		" Visualモードのとき
		let l:first_line = line("'<")	" 選択範囲の上端
		let l:last_line  = line("'>")	" 選択範囲の下端
	endif

	" 処理モードの変数/定数
	let l:action_mode = 0	" 取り付け / 取り除き / 初期状態(モード決定前) を区別するための変数
	let l:const_add   = 1	" 取り付けを表わす定数
	let l:const_del   = 2	" 取り除きを表わす定数

	" コメントアウト記号の取り付け/取り除き処理 (ループ内における初回の処理でモードを決定する)
	while l:first_line <= l:last_line
		let l:cur_str = getline(l:first_line)

		if '' != l:cur_str
			" 行が空でないとき

			if l:const_add != l:action_mode
				" 取り除きor初期状態のとき
				let l:prefix_pos =  stridx(l:cur_str, l:sign_hash['prefix'])
				let l:suffix_pos = strridx(l:cur_str, l:sign_hash['suffix'])
				let l:strlen_without_suffix = strlen(l:cur_str) - strlen(l:sign_hash['suffix'])
			endif

			if l:const_add != l:action_mode && (0 == l:prefix_pos && l:strlen_without_suffix == l:suffix_pos)
				" 取り除きor初期状態 and 行頭と行末に記号があるとき

				" prefix / suffix を取り除いて置き換える
				let l:strlen_prefix = strlen(l:sign_hash['prefix'])
				call setline(l:first_line, strpart(l:cur_str, l:strlen_prefix, l:strlen_without_suffix - l:strlen_prefix))

				" 処理モードを'取り除き'で決定
				let l:action_mode = l:const_del
			elseif l:const_del != l:action_mode
				" 取り付けor初期状態のとき

				" prefix / suffix を取り付けて置き換える
				call setline(l:first_line, substitute(l:cur_str, '^\(.*\)$', l:sign_hash['prefix'] . '\1' . l:sign_hash['suffix'], ''))

				" 処理モードを'取り付け'で決定
				let l:action_mode = l:const_add
			endif
		end

		let l:first_line = l:first_line + 1
	endwhile
endfunction
command! MyToggleTemporaryCommentoutForNormal call s:toggleTemporaryCommentout(0)
command! MyToggleTemporaryCommentoutForVisual call s:toggleTemporaryCommentout(1)

nnoremap <LEADER>c :<C-u>MyToggleTemporaryCommentoutForNormal<CR>
vnoremap <LEADER>c :<C-u>MyToggleTemporaryCommentoutForVisual<CR>
