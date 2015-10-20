
if test -f ~/.dotfilesrc; then
    source ~/.dotfilesrc
fi

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# Path to your oh-my-zsh configuration.
if test -d "$DOTFILES_HOME/.oh-my-zsh"; then
    ZSH="$DOTFILES_HOME/.oh-my-zsh"
    ZSH_CUSTOM=$DOTFILES_HOME/.oh-my-zsh-customizations
else
    echo "Fatal: Can't find .oh-my-zsh! Most probably ~/.dotfilesrc contains an invalid path."
    return
fi


export POWERLINE_ROOT=$(pip show powerline-status | grep Location | awk -F": " '{print $2}')
_powerline_setup() {
	if test -n "$POWERLINE_ROOT" -a -f "$POWERLINE_ROOT/powerline/bindings/zsh/powerline.zsh" ; then
		if which powerline-daemon >& /dev/null; then powerline-daemon -q; fi
		. "$POWERLINE_ROOT/powerline/bindings/zsh/powerline.zsh"
	fi
}


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="gnzh"
ZSH_THEME="agnoster"
#ZSH_THEME="amuse"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

DEFAULT_USER=`whoami`

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew aws)

source $ZSH/oh-my-zsh.sh

if test -f /usr/share/zsh/vendor-completions/_awscli; then
	. /usr/share/zsh/vendor-completions/_awscli
fi

# Customize to your needs...
