
if command -V brew >/dev/null 2>&1; then
  BREW_PREFIX=$(brew --prefix)
  export PATH=${BREW_PREFIX}/bin:${BREW_PREFIX}/sbin:$PATH
fi


if test -d ~/bin; then
  export PATH=~/bin:$PATH
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

#test "`type -t __git_ps1`" = "function" && export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
#test "`type -t __git_ps1`" = "function" && export PS1='\h:\W \u $(__git_ps1 "(%s)")\$ '

# vim:ts=2:sw=2:et:
