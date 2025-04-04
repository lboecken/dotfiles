#!/bin/bash 

TARGET=$HOME
SOURCE=$(pwd)

declare -a STOW_DIRS=( "git" "keyboards" "nvim" "scripts" "tmux" "zsh" "alacritty" "starship" "aerospace")

for folder in "${STOW_DIRS[@]}"
do
    stow --dir=$SOURCE --target=$TARGET -D $folder
    stow --dir=$SOURCE --target=$TARGET $folder
done 
