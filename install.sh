#!/bin/bash

if test -n "${BASH_SOURCE}"; then
  DOTFILES_HOME=$(cd "`dirname "${BASH_SOURCE}"`" && pwd)
else 
  DOTFILES_HOME=$(cd "`dirname $0`" && pwd)
fi

LINK_BKP_DIR=${DOTFILES_HOME}/.link.bkp

function fail {
  echo "Fatal: $1"
  exit 1
}

function link_file {
  for f in "$@"; do
    if test ! -f "${DOTFILES_HOME}/$f" -a ! -d "${DOTFILES_HOME}/$f"; then
        echo  "...not found $f"
        continue
    fi
    if test -h ~/"$f" -a "$(readlink ~/"$f")" = "${DOTFILES_HOME}/$f"; then
      echo "...skipping link $f"
      continue
    fi
    if test -f ~/"$f" ; then
      mv -i ~/"$f" "${LINK_BKP_DIR}"/ && echo "...backup $f"
    elif test -d ~/"$f"; then
      mv -i ~/"$f" "${LINK_BKP_DIR}"/ && echo "...backup $f"
    fi

    ln -s "${DOTFILES_HOME}/$f" ~/"$f" && echo "...linked $f"
  done
}

cat <<HERE > ~/.dotfilesrc
export DOTFILES_HOME=${DOTFILES_HOME}
HERE

link_file .vimrc .vim .bash_profile .zshrc .zshenv

cd .dotfiles/.vim/bundle/vimproc.vim/ && make clean; make

# vim:ts=2:sw=2:et:
