#!/bin/bash 

TARGET=$HOME
SOURCE="/Users/lennart/dotfiles/"

declare -a STOW_DIRS=( "git" "keyboards" "nvim" "scripts" "tmux" "zsh" )

for folder in "${STOW_DIRS[@]}"
do
    stow --dir=$SOURCE --target=$TARGET -D $folder
done 
