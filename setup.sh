#!/bin/sh
D=$(cd $(dirname $0);pwd)
case "${OSTYPE}" in
darwin*)
    echo "setup dotfiles for Mac OS"
    ;;
linux*)
    echo "setup dotfiles for Linux"
    ;;
esac

if test ! -e $HOME/.zshrc
then
    ln -s $D/zsh/zshrc $HOME/.zshrc
else
    echo ".zshrc already exists"
fi
