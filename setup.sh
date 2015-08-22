#!/bin/zsh

BASE=$(cd $(dirname $0) && pwd)

ln -snf ${BASE}/.zsh.d/ ${HOME}/.zsh.d
ln -snf ${BASE}/.zshenv ${HOME}/.zshenv
ln -snf ${BASE}/.zshrc ${HOME}/.zshrc
ln -snf ${BASE}/.emacs.d ${HOME}/.emacs.d
ln -snf ${BASE}/.atom ${HOME}/.atom
ln -snf ${BASE}/.tmux.conf ${HOME}/.tmux.conf
ln -snf ${BASE}/bin ${HOME}/bin

source ${HOME}/.zshenv
source ${HOME}/.zshrc
