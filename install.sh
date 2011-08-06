#!/bin/bash

MY_ENV="my.environment"
BACKUP_EXT="before.$MY_ENV"

echo
echo Installing my.environment
echo -------------------------
echo

BASHRC=".bashrc"
SOURCE_BASHRC="$HOME/$BASHRC"
ALIASES="aliases.bash"

# Set up git
GITCONFIG=".gitconfig"
TARGET_GITCONFIG="$HOME/$MY_ENV/git/$GITCONFIG"
SOURCE_GITCONFIG="$HOME/$GITCONFIG"
echo "Create symlink for $GITCONFIG ..."
if [ -h $SOURCE_GITCONFIG ]; then
  echo "  symlink exists; do nothing."
elif [ -e $SOURCE_GITCONFIG ]; then
  echo "  File exists; backing it up"
  mv $SOURCE_GITCONFIG $SOURCE_GITCONFIG.$BACKUP_EXT
  ln -s $TARGET_GITCONFIG $SOURCE_GITCONFIG
else
  ln -s $TARGET_GITCONFIG $SOURCE_GITCONFIG
fi

# Set up vim
VIM_DIR="vim"
VIM=".vim"
TARGET_VIM="$HOME/$MY_ENV/$VIM_DIR/$VIM"
SOURCE_VIM="$HOME/$VIM"
VIMRC=".vimrc"
TARGET_VIMRC="$HOME/$MY_ENV/$VIM_DIR/$VIMRC"
SOURCE_VIMRC="$HOME/$VIMRC"
echo
echo "Create symlink for $VIM ..."
if [ -h $SOURCE_VIM ]; then
  echo "  symlink exists; do nothing."
elif [ -e $SOURCE_VIM ]; then
  echo "  File exists; backing it up"
  mv $SOURCE_VIM $SOURCE_VIM.$BACKUP_EXT
  ln -s $TARGET_VIM $SOURCE_VIM
else
  ln -s $TARGET_VIM $SOURCE_VIM
fi

echo
echo "Create symlink for $VIMRC ..."
if [ -h $SOURCE_VIMRC ]; then
  echo "  symlink exists; do nothing."
elif [ -e $SOURCE_VIMRC ]; then
  echo "  File exists; backing it up"
  mv $SOURCE_VIMRC $SOURCE_VIMRC.$BACKUP_EXT
  ln -s $TARGET_VIMRC $SOURCE_VIMRC
else
  ln -s $TARGET_VIMRC $SOURCE_VIMRC
fi

# Set up bash
# But, first check if we're already sourcing aliases.bash:
echo
echo "Add line to $BASHRC to source $ALIASES file"
if [ `grep "$ALIASES" $BASHRC | wc -l` -eq 0 ]; then
  echo >> $SOURCE_BASHRC
  echo "# Source $ALIASES file from ~/my.environment/bash dir" >> $SOURCE_BASHRC
  echo ". ~/$MY_ENV/bash/$ALIASES" >> $SOURCE_BASHRC
  echo
  echo "Now you need to run 'source ~/$BASHRC'"
else
  echo "  Already done, do nothing"
fi

echo
echo "All done!"
echo
