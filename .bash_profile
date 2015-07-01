
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if test -f ~/.dotfilesrc; then
  . ~/.dotfilesrc
fi

if command -V brew >/dev/null 2>&1; then
  BREW_PREFIX=$(brew --prefix)
  if [ -f ${BREW_PREFIX}/etc/bash_completion ]; then
    . ${BREW_PREFIX}/etc/bash_completion
  fi
  export PATH=${BREW_PREFIX}/bin:${BREW_PREFIX}/sbin:$PATH
fi


if test -d ~/bin; then
  export PATH=~/bin:$PATH
fi

if test -e /usr/bin/aws_completer; then
  complete -C '/usr/bin/aws_completer' aws
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
test "`type -t __git_ps1`" = "function" && export PS1='\h:\W \u $(__git_ps1 "(%s)")\$ '

export PATH=/home/alex/Qt5/5.4/gcc_64/bin/:/home/alex/Qt5/Tools/QtCreator/bin/:$PATH

# vim:ts=2:sw=2:et:
