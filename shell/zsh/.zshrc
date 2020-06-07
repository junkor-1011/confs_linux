
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

# user define functions
if [ -f $HOME/.zsh_udf ]; then
    source $HOME/.zsh_udf
    # autoload $HOME/.zsh_udf
fi

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000


# ENVS ---------------------
# ToDo: bashなどと共通のファイルにしたい

# default editor
if [ -f /usr/bin/nvim ]; then
    export EDITOR=/usr/bin/nvim
else
    export EDITOR=/usr/bin/vim
fi



# pyenv
if [ -d $HOME/.pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    source $(pyenv root)/completions/pyenv.zsh
fi

# -----------------------

# fzf auto-generated
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# plugins
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "mafredri/zsh-async"
# zplug "sindresorhus/pure"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zdharma/history-search-multi-word"
zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "chrissicool/zsh-256color"
# zplug "woefe/git-prompt.zsh"
zplug "Tarrasch/zsh-bd"
zplug "rupa/z", use:z.sh
zplug "mollifier/cd-gitroot"
zplug "liangguohuan/zsh-dircolors-solarized"

# zplug "woefe/git-prompt.zsh", use:examples/multiline.zsh
zplug "woefe/git-prompt.zsh"
# source $HOME/.zplug/repos/woefe/git-prompt.zsh/examples/rprompt.zsh
# source $HOME/.zplug/repos/woefe/git-prompt.zsh/examples/multiline.zsh
source $HOME/.zplug/repos/woefe/git-prompt.zsh/examples/pure.zsh
# ZSH_GIT_PROMPT_ENABLE_SECONDARY=1

# Load theme file
# zplug 'dracula/zsh', as:theme
# zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
# zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# zplug "sorin-ionescu/prezto"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load


# PATHの重複削除 (zsh)
typeset -U path PATH


# -------------------

# local setting

# ファイル名は適当
if [ -f $HOME/.local_profile.rc ]; then
   source $HOME/.local_profile.rc
fi

