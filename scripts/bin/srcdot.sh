#!/bin/bash
# $HOME_DIR/dotfiles/install

for session in $(tmux list-sessions| cut -d: -f 1)
do 
    echo "$session"
done
