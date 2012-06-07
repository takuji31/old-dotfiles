setup: $(HOME)/.zshenv \
	   $(HOME)/.zshrc


$(HOME)/.zshenv:
	ln -s `pwd`/zsh/zshenv $(HOME)/.zshenv

$(HOME)/.zshrc:
	ln -s `pwd`/zsh/zshrc $(HOME)/.zshrc
