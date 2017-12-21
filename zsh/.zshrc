source ~/.zplug/init.zsh


# Let zplug manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Plugins
zplug "modules/history",        from:prezto, depth:1
zplug "plugins/git",            from:oh-my-zsh, depth:1
zplug "plugins/docker",         from:oh-my-zsh, depth:1
zplug "plugins/docker-compose", from:oh-my-zsh, depth:1
zplug "plugins/extract",        from:oh-my-zsh, depth:1
zplug "robbyrussell/oh-my-zsh", use:"lib/grep.zsh", depth:1
zplug "robbyrussell/oh-my-zsh", use:"lib/key-bindings.zsh", depth:1
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions",         defer:0
zplug "zsh-users/zsh-autosuggestions",     defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:3, on:"zsh-users/zsh-autosuggestions"

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
zplug load

ZSH_HIGHLIGHT_STYLES[path]=fg=cyan,underline=none
