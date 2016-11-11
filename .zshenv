
#
# '.zshenv' is sourced on all invocations of the shell, unless the -f option is
# set. It should contain commands to set the command search path, plus other
# important environment variables. `.zshenv' should not contain commands that
# produce output or assume the shell is attached to a tty.
#

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# OSX system-wide environment settings
if test -x /usr/libexec/path_helper; then
  eval `/usr/libexec/path_helper -s`
fi

if test -f ~/.localenv; then
  . ~/.localenv
fi

if test -f ~/.dotfilesrc; then
  . ~/.dotfilesrc
fi

if command -V brew >/dev/null 2>&1; then
  BREW_PREFIX=$(brew --prefix)
  if [[ ! $PATH =~ "${BREW_PREFIX}/bin" ]]; then
    export PATH=${BREW_PREFIX}/bin:${BREW_PREFIX}/sbin:$PATH
  fi
fi

if [[ -d "~/bin" && ! $PATH =~ "~/bin" ]] then
  export PATH=~/bin:$PATH
fi

if [[ -d "~/.cabal/bin" && ! $PATH =~ "~/.cabal/bin" ]] then
  export PATH=~/.cabal/bin:$PATH
fi

case "$OSTYPE" in
  solaris*) IS_SOLARIS=1 ;;
  darwin*)  IS_DARWIN=1 ;; 
  linux*)   IS_LINUX=1 ;;
  bsd*)     IS_BSD=1 ;;
  *)        echo "Unknown: $OSTYPE" ;;
esac

if test "$IS_DARWIN" = "1" ; then
  export UNDODIR=~/Library/Vim/undo
  test -d $UNDODIR || mkdir -p $UNDODIR
fi

# vim:ts=2:sw=2:et:
