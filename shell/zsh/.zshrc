
# ToDo: 最初に行うべき設定と最後に行うべき設定とに区別・整理 (可能ならファイル毎分離)

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# alias

# alias ls="ls -FG --color=auto"
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -F'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -AF'
alias l='ls -CF'

# moving directory
setopt auto_cd
setopt auto_pushd

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

# execute command
setopt correct
setopt list_packed


# ---------------------------------- #
# Plugins
# using zplug
if [ -f $HOME/.zsh_local/zplug_setting.zsh ]; then
    source $HOME/.zsh_local/zplug_setting.zsh
fi
# ---------------------------------- #



# local setting -------------------- #
# ToDo: 順序や位置づけなど


# fzf auto-generated
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# user define functions
if [ -f $HOME/.zsh_local/udf.zsh ]; then
    source $HOME/.zsh_local/udf.zsh
    # autoload $HOME/.zsh_udf
fi


# ファイル名は適当
# zsh
if [ -f $HOME/.zsh_local/local_rc.zsh ]; then
    source $HOME/.zsh_local/local_rc.zsh
fi

# symbolic linkを張って`bash`と`zsh`で共有するなど
if [ -f $HOME/.zsh_local/local_rc.sh ]; then
   source $HOME/.zsh_local/local_rc.sh
fi


# PATHの重複削除 (zsh)
typeset -U path PATH

