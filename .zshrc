# === 初期設定 ===

# zinit の設定
# https://github.com/zdharma-continuum/zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ -d "$ZINIT_HOME" ] || {
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
}
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# 環境設定
export EDITOR=vim
export LANG=ja_JP.UTF-8
setopt print_eight_bit
setopt no_beep

# 色の設定
autoload -Uz colors
colors
export LSCOLORS=DxGxcxdxCxegedabagacad

# 入力補完
autoload -U compinit
compinit

# zsh-hook
autoload -Uz add-zsh-hook

# === zinit plugin ===
zinit load azu/ni.zsh

zinit load zsh-users/zsh-completions
fpath=(~/.zsh/zsh-completions/src $fpath)

# === プロンプト設定 ===
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git fossil
zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" formats "(%b) "
zstyle ":vcs_info:git:*" actionformats "%c%u<%a>(%b) "
zstyle ':vcs_info:fossil:*' check-for-changes true
zstyle ':vcs_info:fossil:*' formats 'fossil:(%b)'
zstyle ':vcs_info:fossil:*' actionformats 'fossil:(merge:%b)'

precmd () {
    vcs_info
    if [[ -n "$vcs_info_msg_0_" ]]; then
        psvar[1]="$vcs_info_msg_0_"
    else
        psvar[1]=""
    fi
}

WATCH_MARK=$'\U2617'
PROMPT="%F{71}%n@%m %F{106}%~ %F{1}%1v%F{239} ${WATCH_MARK} %T
%F{245}%(!,#,$)%F{255} "
RPROMPT="%F{240}%D{%Y-%m-%d} %T%f"

# === 履歴設定 ===
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=5000
export SAVEHIST=10000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt auto_pushd
setopt pushd_ignore_dups

# === PATH ===
export PATH=${HOME}/bin:/usr/local/bin:/usr/bin:${PATH}

# === エイリアス ===
if [ "$(uname)" = 'Darwin' ]; then
    alias ll='ls -alG'
else
    alias ll='ls -al --color=auto'
fi
alias vi='vim'
alias gti='git'
alias be='bundle exec'
alias ber='bundle exec ruby'
alias binstall='bundle install -j4'
alias nr='ni run'
alias fo='fossil'
alias fost='fossil status'

# === tmux ===
show-current-dir-as-window-name() {
  tmux set-window-option window-status-format " #I ${PWD:t} " > /dev/null
}
show-current-dir-as-window-name
add-zsh-hook chpwd show-current-dir-as-window-name

# === npm ===
export NPM_CONFIG_INIT_AUTHOR_NAME='ru_shalm'
export NPM_CONFIG_INIT_AUTHOR_EMAIL='ru_shalm@hazimu.com'
export NPM_CONFIG_INIT_LICENSE='MIT'
export NPM_CONFIG_INIT_VERSION='0.1.0'

# === .local ===
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

