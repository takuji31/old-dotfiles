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

