
# fzf auto-generated
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# plugins
source ~/.zplug/init.zsh

# zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zdharma/history-search-multi-word"
zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "woefe/git-prompt.zsh"
zplug "Tarrasch/zsh-bd"


# Load theme file
zplug 'dracula/zsh', as:theme

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

