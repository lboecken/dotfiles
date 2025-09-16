#!/bin/bash 

TARGET=$HOME
SOURCE="/Users/lennart/dotfiles/"

declare -a STOW_DIRS=( "git" "nvim" "scripts" "tmux" "zsh" "alacritty" "starship" "aerospace" "lazygit")

for folder in "${STOW_DIRS[@]}"
do
    stow --dir=$SOURCE --target=$TARGET -D $folder
done 
