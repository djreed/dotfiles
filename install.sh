#!/bin/sh

ln -sfn ~/dotfiles/emacs/ ~/
ln -sfn ~/dotfiles/.zshrc ~/
ln -sfn ~/dotfiles/.p10k.zsh ~/
ln -sfn ~/dotfiles/.atom/ ~/ ### RIP
ln -sfn ~/dotfiles/.pulsar/ ~/

# cd .atom && sh install-packages.sh ### RIP
cd .pulsar && sh install-packages.sh
