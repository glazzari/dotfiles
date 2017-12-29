# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
   git clone https://github.com/zplug/zplug ~/.zplug
   source ~/.zplug/init.zsh && zplug update --self
fi

# Check if tpm is installed
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

source ~/.zplug/init.zsh

zstyle ":zplug:tag" depth 1

# Let zplug manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Plugins
zplug "modules/prompt", from:prezto
zplug "modules/history", from:prezto
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/tmuxinator", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "robbyrussell/oh-my-zsh", use:"lib/grep.zsh"
zplug "robbyrussell/oh-my-zsh", use:"lib/key-bindings.zsh"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "mafredri/zsh-async", from:github
zplug "chriskempson/base16-shell", use:"scripts/base16-ocean.sh"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Theme
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
	echo; zplug install
    fi
fi

# Source plugins
zplug load

# Options
unsetopt correct_all

# Pure single line prompt
prompt pure
prompt_newline='%666v'
PROMPT=" $PROMPT"

ZSH_HIGHLIGHT_STYLES[path]=underline=none

# Load aliases
if [ -f ~/.zsh_aliases ] ; then source ~/.zsh_aliases; fi

if [ $TILIX_ID ] || [ $VTE_VERSION ] ; then source /etc/profile.d/vte.sh; fi # Ubuntu Budgie END
