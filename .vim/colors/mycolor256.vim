" 初期化 =======================================================================
set background=dark

if exists('syntax_on')
	hi clear
	syntax reset
endif

let colors_name = 'mycolor256'

" 色辞書
let s:color_dict = {
	\'none':		{'c': 'NONE',	'g': 'NONE'},
	\'black':		{'c': '0',		'g': '000000'},
	\'red':			{'c': '9',		'g': 'ff5555'},
	\'white':		{'c': '15',		'g': 'ffffff'},
	\'teal_green':	{'c': '23',		'g': '005f5f'},
	\'teal_blue':	{'c': '37',		'g': '00afaf'},
	\'green':		{'c': '41',		'g': '00d75f'},
	\'water':		{'c': '44',		'g': '00d7d7'},
	\'blue':		{'c': '68',		'g': '5f87d7'},
	\'green2':		{'c': '113',	'g': '87d787'},
	\'water2':		{'c': '117',	'g': '87d7ff'},
	\'water3':		{'c': '153',	'g': 'afd7ff'},
	\'green3':		{'c': '155',	'g': 'aaff66'},
	\'brown':		{'c': '173',	'g': 'd7875f'},
	\'purple':		{'c': '189',	'g': 'd7d7ff'},
	\'olive':		{'c': '190',	'g': 'd7ff87'},
	\'red2':		{'c': '210',	'g': 'ee7777'},
	\'pink':		{'c': '213',	'g': 'ff87ff'},
	\'skin':		{'c': '222',	'g': 'ffd787'},
	\'cream':		{'c': '229',	'g': 'ffffa0'},
	\'gray_2':		{'c': '235',	'g': '262626'},
	\'gray_3':		{'c': '236',	'g': '303030'},
	\'gray_4':		{'c': '238',	'g': '444444'},
	\'gray_6':		{'c': '241',	'g': '626262'},
	\'gray_7':		{'c': '243',	'g': '767676'},
	\'gray_9':		{'c': '246',	'g': '949494'},
	\'gray_c':		{'c': '252',	'g': 'd0d0d0'},
	\}

" 設定関数
function! s:defineHighlightColor(target, fg, bg)
exe 'hi ' . a:target . ' ctermfg=' . s:color_dict[a:fg]['c'] . ' ctermbg=' . s:color_dict[a:bg]['c'] . ' cterm=NONE guifg=#' . s:color_dict[a:fg]['g'] . ' guibg=#' . s:color_dict[a:bg]['g'] . ' gui=NONE'
endfunction

" 通常 =========================================================================
" 通常
call s:defineHighlightColor('Normal', 'white', 'gray_2')
" 行番号
call s:defineHighlightColor('LineNr', 'gray_9', 'black')
" ウィンドウ、改行、行末
call s:defineHighlightColor('NonText', 'gray_9', 'black')
" タブ
call s:defineHighlightColor('SpecialKey', 'gray_4', 'gray_2')
" 垂直分割区切り
call s:defineHighlightColor('VertSplit', 'gray_9', 'black')
" ステータスライン
call s:defineHighlightColor('StatusLine', 'gray_c', 'teal_green')
" 非カレントステータスライン
call s:defineHighlightColor('StatusLineNC', 'gray_9', 'gray_3')

" カーソル =====================================================================
" カーソル位置
call s:defineHighlightColor('Cursor', 'black', 'white')
" IMEモードカーソル位置
call s:defineHighlightColor('CursorIM', 'white', 'red')
" ヴィジュアルモード選択
call s:defineHighlightColor('Visual', 'none', 'gray_9')

" コマンドライン ===============================================================
" モード移行時のメッセージ
call s:defineHighlightColor('ModeMsg', 'black', 'olive')
" スクロールを促すメッセージ
call s:defineHighlightColor('MoreMsg', 'black', 'water2')
" エンターを促すメッセージ
call s:defineHighlightColor('Question', 'red', 'none')
" 警告メッセージ
call s:defineHighlightColor('WarningMsg', 'white', 'red')
" エラーメッセージ
call s:defineHighlightColor('ErrorMsg', 'white', 'red')

" タブ =========================================================================
" タブライン
call s:defineHighlightColor('TabLineFill', 'gray_9', 'black')
" カレントタブ
call s:defineHighlightColor('TabLine', 'gray_c', 'teal_green')
" 非カレントタブ
call s:defineHighlightColor('TabLine', 'gray_9', 'black')

" ポップアップ =================================================================
" メニュー
call s:defineHighlightColor('Pmenu', 'white', 'gray_6')
" 選択項目
call s:defineHighlightColor('PmenuSel', 'gray_3', 'water')
" スクロールバー
call s:defineHighlightColor('PmenuSbar', 'black', 'white')
" スクロールバーつまみ
call s:defineHighlightColor('PmenuThumb', 'black', 'green')

" 特殊文字 =====================================================================
" ディレクトリ名
call s:defineHighlightColor('Directory', 'skin', 'none')
" 対応括弧
call s:defineHighlightColor('MatchParen', 'none', 'gray_6')

" 検索 =========================================================================
" 検索
call s:defineHighlightColor('Search', 'black', 'olive')
" インクリメント検索
call s:defineHighlightColor('IncSearch', 'black', 'water2')

" シンタックス =================================================================
" コメント
call s:defineHighlightColor('Comment', 'gray_7', 'none')

" 定数全般
call s:defineHighlightColor('Constant', 'green2', 'none')
" 真偽
call s:defineHighlightColor('Boolean', 'green2', 'none')
" 文字
call s:defineHighlightColor('Character', 'green2', 'none')
" 文字列
call s:defineHighlightColor('String', 'green3', 'none')
" 数値
call s:defineHighlightColor('Number', 'pink', 'none')
" 浮動小数点数
call s:defineHighlightColor('Float', 'pink', 'none')

" 関数名、開始タグ
call s:defineHighlightColor('Function', 'skin', 'none')
" 変数名、終了タグ
call s:defineHighlightColor('Identifier', 'purple', 'none')

" 命令文全般
call s:defineHighlightColor('Statement', 'blue', 'none')
" if
call s:defineHighlightColor('Conditional', 'blue', 'none')
" for
call s:defineHighlightColor('Repeat', 'blue', 'none')
" default
call s:defineHighlightColor('Label', 'blue', 'none')
" try
call s:defineHighlightColor('Exception', 'blue', 'none')
" 演算子
call s:defineHighlightColor('Operator', 'water2', 'none')
" その他のキーワード
call s:defineHighlightColor('Keyword', 'water2', 'none')

" プリプロセッサ全般
call s:defineHighlightColor('PreProc', 'red2', 'none')
" include
call s:defineHighlightColor('Include', 'red2', 'none')
" define
call s:defineHighlightColor('Define', 'red2', 'none')

" int、static、typedefなどの宣言全般
call s:defineHighlightColor('Type', 'cream', 'none')

" 特殊なシンボル全般
call s:defineHighlightColor('Special', 'brown', 'none')
" デリミタ
call s:defineHighlightColor('Delimiter', 'teal_blue', 'none')

" titleタグのインナーテキスト
call s:defineHighlightColor('Title', 'white', 'none')
" aタグのインナーテキスト
call s:defineHighlightColor('Underlined', 'water3', 'none')

" 不可視文字
call s:defineHighlightColor('Ignore', 'gray_c', 'none')
" エラー
call s:defineHighlightColor('Error', 'white', 'red')
" TODO
call s:defineHighlightColor('Todo', 'black', 'white')

" 便利コマンド -----------------------------------------------------------------
" so $VIMRUNTIME/syntax/hitest.vim = 現在の設定を確認する
