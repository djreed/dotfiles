#!/bin/sh

ln -sfn ~/dotfiles/emacs/ ~/.emacs.d
ln -sfn ~/dotfiles/.zshrc ~/.zshrc

ln -sfn ~/dotfiles/.atom/ ~/.atom
sh ~/dotfiles/.atom/install-packages.sh
