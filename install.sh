#!/bin/sh

ln -sfn ~/dotfiles/emacs/ ~/
ln -sfn ~/dotfiles/.zshrc ~/
ln -sfn ~/dotfiles/.p10k.zsh ~/
ln -sfn ~/dotfiles/.atom/ ~/

sh ~/dotfiles/.atom/install-packages.sh
