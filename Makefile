setup:  $(HOME)/.zshenv \
        $(HOME)/.zshrc\
        $(HOME)/.gvimrc


$(HOME)/.zshenv:
	ln -s `pwd`/zsh/zshenv.zsh $(HOME)/.zshenv

$(HOME)/.zshrc:
	ln -s `pwd`/zsh/zshrc.zsh $(HOME)/.zshrc

$(HOME)/.gvimrc:
	ln -s `pwd`/vim/gvimrc.vim $(HOME)/.gvimrc
