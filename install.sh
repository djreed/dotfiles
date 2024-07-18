#!/bin/sh

ln -sfn ~/dotfiles/.zshrc ~/
ln -sfn ~/dotfiles/emacs/ ~/.emacs.d
ln -sfn ~/dotfiles/.p10k.zsh ~/
# ln -sfn ~/dotfiles/.atom/ ~/ ### RIP
# ln -sfn ~/dotfiles/.pulsar/ ~/ ### RIP in favor of VSCode, which is synced to my GitHub account
ln -sfn ~/dotfiles/.tmux.conf ~/

# cd .atom && sh install-packages.sh ### RIP
# cd .pulsar && sh install-packages.sh
