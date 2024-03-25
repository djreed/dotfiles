#!/bin/sh

ln -sfn ~/dotfiles/emacs/ ~/
ln -sfn ~/dotfiles/.zshrc ~/
ln -sfn ~/dotfiles/.p10k.zsh ~/
ln -sfn ~/dotfiles/.atom/ ~/
ln -sfn ~/dotfiles/.pulsar/ ~/

cd .atom && sh install-packages.sh
