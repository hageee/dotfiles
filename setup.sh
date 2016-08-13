#!/bin/zsh

BASE=$(cd $(dirname $0) && pwd)

ln -snf ${BASE}/.zsh.d/ ${HOME}/.zsh.d
ln -snf ${BASE}/.emacs.d ${HOME}/.emacs.d
ln -snf ${BASE}/.atom ${HOME}/.atom
ln -snf ${BASE}/.tmux.conf ${HOME}/.tmux.conf
ln -snf ${BASE}/.vimrc ${HOME}/.vimrc
ln -snf ${BASE}/.gitignore_global ${HOME}/.gitignore_global

echo 'source ~/dotfiles/.zsh.d/zshenv' > ${HOME}/.zshenv
echo 'source ~/dotfiles/.zsh.d/zshrc' > ${HOME}/.zshrc

source ${HOME}/.zshenv
source ${HOME}/.zshrc

git config --global core.excludesfile ~/.gitignore_global
