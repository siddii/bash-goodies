#!/bin/bash

BASH_UTILS_DIR="$HOME/.bash-utils"

if [ -d "$BASH_UTILS_DIR" ]; then
  echo "=> bash-utils is already installed in $BASH_UTILS_DIR, trying to update"
  echo -ne "\r=> "
  cd $BASH_UTILS_DIR && git pull
else
  # Cloning to $BASH_UTILS_DIR
  git clone https://github.com/siddii/bash-utils.git $BASH_UTILS_DIR
fi

echo

# Detect profile file, .bash_profile has precedence over .profile
if [ ! -z "$1" ]; then
  PROFILE="$1"
else
  if [ -f "$HOME/.bash_profile" ]; then
	PROFILE="$HOME/.bash_profile"
  elif [ -f "$HOME/.profile" ]; then
	PROFILE="$HOME/.profile"
  fi
fi

SOURCE_STR="[[ -s "$BASH_UTILS_DIR/bash-utils.sh" ]] && . "$BASH_UTILS_DIR/bash-utils.sh"  # This loads bash-utils"

if [ -z "$PROFILE" ] || [ ! -f "$PROFILE" ] ; then
  if [ -z $PROFILE ]; then
	echo "=> Profile not found. Tried $HOME/.bash_profile and $HOME/.profile"
  else
	echo "=> Profile $PROFILE not found"
  fi
  echo "=> Run this script again after running the following:"
  echo
  echo "\ttouch $HOME/.profile"
  echo
  echo "-- OR --"
  echo
  echo "=> Append the following line to the correct file yourself"
  echo
  echo "\t$SOURCE_STR"
  echo
  echo "=> Close and reopen your terminal afterwards to start using bash-utilities"
  exit
fi

if ! grep -qc 'bash-utils.sh' $PROFILE; then
  echo "=> Appending source string to $PROFILE"
  echo "" >> "$PROFILE"
  echo $SOURCE_STR >> "$PROFILE"
else
  echo "=> Source string already in $PROFILE"
fi

echo "=> Close and reopen your terminal to start using bash-utils"