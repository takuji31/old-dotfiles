setup:  $(HOME)/.zshenv\
        $(HOME)/.zshrc\
        $(HOME)/.gvimrc\
        $(HOME)/.vimrc\
        $(HOME)/.vim\
		$(HOME)/.tmux.conf\
        $(HOME)/.gitconfig\
        $(HOME)/.gitignore\
        $(HOME)/.gitattributes\
        $(HOME)/.dim\
        $(HOME)/.emacs.d\
        $(HOME)/.config/fish\


$(HOME)/.zshenv:
	ln -s `pwd`/zsh/zshenv.zsh $(HOME)/.zshenv

$(HOME)/.zshrc:
	ln -s `pwd`/zsh/zshrc.zsh $(HOME)/.zshrc

$(HOME)/.gvimrc:
	ln -s `pwd`/vim/gvimrc.vim $(HOME)/.gvimrc

$(HOME)/.vimrc:
	ln -sf `pwd`/vim/vimrc.vim $(HOME)/.vimrc

$(HOME)/.vim:
	ln -sf `pwd`/vim $(HOME)/.vim

$(HOME)/.tmux.conf:
	ln -sf `pwd`/tmux/tmux.conf $(HOME)/.tmux.conf

$(HOME)/.gitconfig:
	ln -sf `pwd`/git/gitconfig $(HOME)/.gitconfig

$(HOME)/.gitignore:
	ln -sf `pwd`/git/gitignore $(HOME)/.gitignore

$(HOME)/.gitattributes:
	ln -sf `pwd`/git/gitattributes $(HOME)/.gitattributes

$(HOME)/.dim:
	ln -sf `pwd`/dim $(HOME)/.dim

$(HOME)/.emacs.d:
	ln -sf `pwd`/emacs $(HOME)/.emacs.d

$(HOME)/.config/fish:
	mkdir -p $(HOME)/.config
	ln -sf `pwd`/fish $(HOME)/.config/fish
