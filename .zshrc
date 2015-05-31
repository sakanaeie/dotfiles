# 環境変数 ---------------------------------------------------------------------
export LANG=ja_JP.UTF-8
export EDITOR=vim

# プロンプト -------------------------------------------------------------------
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats '(%F{green}%b%f) '
zstyle ':vcs_info:*' actionformats '(%F{green}%b%f %F{red}*%a%f) '
precmd() { vcs_info }
PROMPT='[%n@%m:%~] ${vcs_info_msg_0_}$ '

# 色 ---------------------------------------------------------------------------
autoload -Uz colors
colors

# 単語の区切り文字 -------------------------------------------------------------
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " _-./;@"
zstyle ':zle:*' word-style unspecified

# 補完 -------------------------------------------------------------------------
autoload -Uz compinit
compinit

# 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# キャッシュ
zstyle ':completion:*' use-cache true
# カラー化
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
if [ -n "$LS_COLORS" ]; then
	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi
# 補完候補を見やすく
setopt list_packed
# コマンド訂正
setopt correct
# globを展開しない
setopt glob_complete
# ctrl-i連打したとき、補完候補を選択しない
unsetopt auto_menu

# 履歴 -------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=40000
SAVEHIST=40000

# ディレクトリスタック (cd -<tab>)
DIRSTACKSIZE=10
setopt auto_pushd
setopt pushd_silent
setopt pushd_ignore_dups
# 重複は古いものから除去
setopt hist_ignore_all_dups
# 履歴保存するとき、余分なスペースを除去
setopt hist_reduce_blanks
# zsh間で履歴を共有
setopt share_history

# 雑多なオプション -------------------------------------------------------------
# 日本語表示
setopt print_eight_bit
#ctrl-dでzshを抜けない
setopt ignore_eof

# キーバインド -----------------------------------------------------------------
bindkey -e

# 履歴検索
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

# エイリアス -------------------------------------------------------------------
alias vi='vim'
alias g='git'
alias eee='exit'

if ls --color=auto >/dev/null 2>&1; then
	alias ls='ls -F --color=auto'
else
	alias ls='ls -FG'
fi
