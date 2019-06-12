
# 日本語
export LANG=ja_JP.UTF-8
setopt print_eight_bit

# 音出さない
setopt no_beep

# 色
autoload -Uz colors
colors
export LSCOLORS=DxGxcxdxCxegedabagacad

# 入力補完
autoload -U compinit
compinit
#zstyle ':completion:*' list-colors '$LSCOLORS'
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# VCS settings
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" formats "(%b) "
zstyle ":vcs_info:git:*" actionformats "%c%u<%a>(%b) "
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# プロンプト
WATCH_MARK=$'\U2617'
ARROW_MARK=$'\U21F8'
PROMPT="%F{71}%n@%m %F{106}%~ %F{1}%1v%F{239}${WATCH_MARK} %T
%F{245}%(!,#,$)%K{0}%F{255} "
RPROMPT=""

# 履歴
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

setopt auto_pushd
setopt pushd_ignore_dups

# path
export PATH=${HOME}/bin:/usr/local/bin:${PATH}

# tmux
show-current-dir-as-window-name() {
  tmux set-window-option window-status-format " #I ${PWD:t} " > /dev/null
}
show-current-dir-as-window-name
add-zsh-hook chpwd show-current-dir-as-window-name

# ENV
export EDITOR=vim

# npm
export NPM_CONFIG_INIT_AUTHOR_NAME='ru_shalm'
export NPM_CONFIG_INIT_AUTHOR_EMAIL='ru_shalm@hazimu.com'
export NPM_CONFIG_INIT_LICENSE='MIT'
export NPM_CONFIG_INIT_VERSION='0.1.0'

# anyenv
if [ -d ${HOME}/.anyenv ]; then
    export PATH=${HOME}/.anyenv/bin:${PATH}
    eval "$(anyenv init -)"
    for ANYENV in `ls ${HOME}/.anyenv/envs`; do
        export PATH=${HOME}/.anyenv/envs/${ANYENV}/shims:${PATH}
    done
fi

# alias
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

# .local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

