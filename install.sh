#!/bin/sh

ln -sfn ~/dotfiles/emacs/ ~/.emacs.d
ln -sfn ~/dotfiles/.zshrc ~/
ln -sfn ~/dotfiles/.p10k.zsh ~/
# ln -sfn ~/dotfiles/.atom/ ~/ ### RIP
ln -sfn ~/dotfiles/.pulsar/ ~/
ln -sfn ~/dotfiles/.tmux.conf ~/

# cd .atom && sh install-packages.sh ### RIP
cd .pulsar && sh install-packages.sh
