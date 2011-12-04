" 初期化 =======================================================================
set background=dark

if exists("syntax_on")
    hi clear
    syntax reset
endif

let colors_name = "mycolor256"

" 画面 =========================================================================
" 通常
hi Normal		ctermfg=15   ctermbg=235  cterm=NONE guifg=#ffffff guibg=#222222 gui=NONE
" 行番号
hi LineNr		ctermfg=247  ctermbg=0    cterm=NONE guifg=#999999 guibg=#000000 gui=NONE
" ウィンドウ、改行、行末
hi NonText		ctermfg=247  ctermbg=0    cterm=NONE guifg=#999999 guibg=#000000 gui=NONE
" タブ
hi SpecialKey	ctermfg=238  ctermbg=235  cterm=NONE guifg=#444444 guibg=#222222 gui=NONE
" 垂直分割区切り
hi VertSplit	ctermfg=247  ctermbg=0    cterm=NONE guifg=#999999 guibg=#000000 gui=NONE
" ステータスライン
hi StatusLine	ctermfg=252  ctermbg=23   cterm=NONE guifg=#cccccc guibg=#223344 gui=NONE
" 非カレントステータスライン
hi StatusLineNC	ctermfg=247  ctermbg=236  cterm=NONE guifg=#999999 guibg=#333333 gui=NONE

" カーソル =====================================================================
" カーソル位置
hi Cursor		ctermfg=0    ctermbg=15   cterm=NONE guifg=#000000 guibg=#ffffff gui=NONE
" IMEモードカーソル位置
hi CursorIM		ctermfg=15   ctermbg=9    cterm=NONE guifg=#ffffff guibg=#ff5555 gui=NONE
" ヴィジュアルモード選択
hi Visual		ctermfg=NONE ctermbg=247  cterm=NONE guifg=NONE    guibg=#999999 gui=NONE

" コマンドライン ===============================================================
" モード移行時のメッセージ
hi ModeMsg		ctermfg=0    ctermbg=191  cterm=NONE guifg=#000000 guibg=#ccee88 gui=NONE
" スクロールを促すメッセージ
hi MoreMsg		ctermfg=0    ctermbg=117  cterm=NONE guifg=#000000 guibg=#88ccee gui=NONE
" エンターを促すメッセージ
hi Question		ctermfg=9    ctermbg=NONE cterm=NONE guifg=#ff5555 guibg=NONE    gui=NONE
" 警告メッセージ
hi WarningMsg	ctermfg=15   ctermbg=9    cterm=NONE guifg=#ffffff guibg=#ff5555 gui=NONE
" エラーメッセージ
hi ErrorMsg		ctermfg=15   ctermbg=9    cterm=NONE guifg=#ffffff guibg=#ff5555 gui=NONE

" ポップアップ =================================================================
" メニュー
hi Pmenu		ctermfg=15   ctermbg=241  cterm=NONE guifg=#ffffff guibg=#666666 gui=NONE
" 選択項目
hi PmenuSel		ctermfg=236  ctermbg=44   cterm=NONE guifg=#333333 guibg=#33ccff gui=NONE
" スクロールバー
hi PmenuSbar	ctermfg=0    ctermbg=15   cterm=NONE guifg=#000000 guibg=#ffffff gui=NONE
" スクロールバーつまみ
hi PmenuThumb	ctermfg=0    ctermbg=41   cterm=NONE guifg=#000000 guibg=#33cc66 gui=NONE

" 特殊文字 =====================================================================
" ディレクトリ名
hi Directory	ctermfg=222  ctermbg=NONE cterm=NONE guifg=#ffcc99 guibg=NONE    gui=NONE
" 対応括弧
hi MatchParen	ctermfg=NONE ctermbg=241  cterm=NONE guifg=NONE    guibg=#666666 gui=NONE

" 検索 =========================================================================
" 検索
hi Search		ctermfg=0    ctermbg=191  cterm=NONE guifg=#000000 guibg=#ccee88 gui=NONE
" インクリメント検索
hi IncSearch	ctermfg=0    ctermbg=117  cterm=NONE guifg=#000000 guibg=#88ccee gui=NONE

" シンタックス =================================================================
" コメント
hi Comment		ctermfg=243  ctermbg=NONE cterm=NONE guifg=#777777 guibg=NONE    gui=NONE

" 定数全般
hi Constant		ctermfg=113  ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE    gui=NONE
" 真偽
hi Boolean		ctermfg=113  ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE    gui=NONE
" 文字
hi Character	ctermfg=113  ctermbg=NONE cterm=NONE guifg=#99cc99 guibg=NONE    gui=NONE
" 文字列
hi String		ctermfg=155  ctermbg=NONE cterm=NONE guifg=#aaff66 guibg=NONE    gui=NONE
" 数値
hi Number		ctermfg=213  ctermbg=NONE cterm=NONE guifg=#ff77ff guibg=NONE    gui=NONE
" 浮動小数点数
hi Float		ctermfg=213  ctermbg=NONE cterm=NONE guifg=#ff77ff guibg=NONE    gui=NONE

" 関数名、開始タグ
hi Function		ctermfg=222  ctermbg=NONE cterm=NONE guifg=#ffcc99 guibg=NONE    gui=NONE
" 変数名、終了タグ
hi Identifier	ctermfg=189  ctermbg=NONE cterm=NONE guifg=#ccccff guibg=NONE    gui=NONE

" 命令文全般
hi Statement	ctermfg=68   ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE    gui=NONE
" if
hi Conditional	ctermfg=68   ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE    gui=NONE
" for
hi Repeat		ctermfg=68   ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE    gui=NONE
" default
hi Label		ctermfg=68   ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE    gui=NONE
" try
hi Exception	ctermfg=68   ctermbg=NONE cterm=NONE guifg=#6699cc guibg=NONE    gui=NONE
" 演算子
hi Operator		ctermfg=117  ctermbg=NONE cterm=NONE guifg=#99ccff guibg=NONE    gui=NONE
" その他のキーワード
hi Keyword		ctermfg=117  ctermbg=NONE cterm=NONE guifg=#99ccff guibg=NONE    gui=NONE

" プリプロセッサ全般
hi PreProc		ctermfg=210  ctermbg=NONE cterm=NONE guifg=#ee7777 guibg=NONE    gui=NONE
" include
hi Include		ctermfg=210  ctermbg=NONE cterm=NONE guifg=#ee7777 guibg=NONE    gui=NONE
" define
hi Define		ctermfg=210  ctermbg=NONE cterm=NONE guifg=#ee7777 guibg=NONE    gui=NONE

" int、static、typedefなどの宣言全般
hi Type			ctermfg=229  ctermbg=NONE cterm=NONE guifg=#ffffbb guibg=NONE    gui=NONE

" 特殊なシンボル全般
hi Special		ctermfg=173  ctermbg=NONE cterm=NONE guifg=#dd8866 guibg=NONE    gui=NONE
" デリミタ
hi Delimiter	ctermfg=37   ctermbg=NONE cterm=NONE guifg=#00bbbb guibg=NONE    gui=NONE

" titleタグのインナーテキスト
hi Title		ctermfg=15   ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE    gui=NONE
" aタグのインナーテキスト
hi Underlined	ctermfg=153  ctermbg=NONE cterm=NONE guifg=#bbddff guibg=NONE    gui=NONE

" 不可視文字
hi Ignore		ctermfg=252  ctermbg=NONE cterm=NONE guifg=#cccccc guibg=NONE    gui=NONE
" エラー
hi Error		ctermfg=15   ctermbg=9    cterm=NONE guifg=#ffffff guibg=#ff5555 gui=NONE
" TODO
hi Todo			ctermfg=0    ctermbg=15   cterm=NONE guifg=#000000 guibg=#ffffff gui=NONE

" 便利コマンド -----------------------------------------------------------------
" so $VIMRUNTIME/syntax/hitest.vim = 現在の設定を確認する
