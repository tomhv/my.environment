#!/bin/bash

BASHRC="../.bashrc"
ALIASES='aliases.bash'

# Set up git
# @todo maybe we need to check if a file already exists and back it up
ln -s ~/my.environment/git/.gitconfig ~/.gitconfig

# Set up vim
# @todo maybe we need to check if a file already exists and back it up
ln -s ~/my.environment/vim/.vim ~/.vim
# @todo maybe we need to check if a file already exists and back it up
ln -s ~/my.environment/vim/.vimrc ~/.vimrc

# Set up bash
# But, first check if we're already sourcing aliases.bash:
if [ `grep "$ALIASES" $BASHRC | wc -l` -eq 0 ]; then
  echo >> $BASHRC
  echo "# Source $ALIASES file from ~/my.environment/bash dir" >> $BASHRC
  echo ". ~/my.environment/bash/$ALIASES" >> $BASHRC
  echo
  echo "Now you need to run 'source ~/$BASHRC'"
  echo
fi
