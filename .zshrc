
#
# '.zshrc' is sourced in interactive shells. It should contain commands to set
# up aliases, functions, options, key bindings, etc.
#

# Path to your oh-my-zsh configuration.
if test -d "$DOTFILES_HOME/.oh-my-zsh"; then
  ZSH="$DOTFILES_HOME/.oh-my-zsh"
  ZSH_CUSTOM=$DOTFILES_HOME/.oh-my-zsh-customizations
else
  echo "Fatal: Can't find .oh-my-zsh! Most probably ~/.dotfilesrc contains an invalid path."
  return
fi


_lpwl() {
  export POWERLINE_ROOT=$(pip --disable-pip-version-check show powerline-status | grep Location | awk -F": " '{print $2}')
  if test -n "$POWERLINE_ROOT" -a -f "$POWERLINE_ROOT/powerline/bindings/zsh/powerline.zsh" ; then
    if which powerline-daemon >& /dev/null; then powerline-daemon -q; fi
      . "$POWERLINE_ROOT/powerline/bindings/zsh/powerline.zsh"
  fi
}

_laws() {
  if test -f "${DOTFILES_HOME}/.oh-my-zsh/plugins/aws/aws.plugin.zsh"; then
    . "${DOTFILES_HOME}/.oh-my-zsh/plugins/aws/aws.plugin.zsh"
  else
    echo "aws plugin not found."
  fi
}

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="gnzh"
#ZSH_THEME="agnoster"
#ZSH_THEME="amuse"
#ZSH_THEME="gnzh"
#ZSH_THEME="cloud"
#ZSH_THEME="agnoster-light"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias vsc="open -a 'Visual Studio Code' ."

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

DEFAULT_USER=`whoami`

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git osx brew aws)
plugins=(git osx brew)

source $ZSH/oh-my-zsh.sh

#if test -f /usr/share/zsh/vendor-completions/_awscli; then
#	. /usr/share/zsh/vendor-completions/_awscli
#fi
#if test -f /usr/local/share/zsh/site-functions/_aws; then
#	source /usr/local/share/zsh/site-functions/_aws
#fi

# Customize to your needs...

# vim:ts=2:sw=2:et:
