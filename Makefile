setup:  $(HOME)/.zshenv \
        $(HOME)/.zshrc\
        $(HOME)/.gvimrc


$(HOME)/.zshenv:
	ln -s `pwd`/zsh/zshenv $(HOME)/.zshenv

$(HOME)/.zshrc:
	ln -s `pwd`/zsh/zshrc $(HOME)/.zshrc

$(HOME)/.gvimrc:
	ln -s `pwd`/vim/gvimrc $(HOME)/.gvimrc
