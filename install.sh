#!/usr/bin/sh

ln -sfn ~/dotfiles/emacs/ ~/.emacs.d
ln -sfn ~/dotfiles/.zshrc ~/.zshrc
ln -sfn ~/dotfiles/.hyper.js ~/.hyper.js
ln -sfn ~/dotfiles/fish/ ~/.config/fish

ln -sfn ~/dotfiles/.atom/ ~/.atom
sh ~/dotfiles/.atom/install-packages.sh
