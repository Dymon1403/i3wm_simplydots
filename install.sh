#!/bin/bash

DOTFILES_DIR=$(pwd)

echo "Starting to installing configs..."

DIRS=("alacritty" "i3" "nvim" "picom" "polybar")

for dir in "${DIRS[@]}"; do
    echo "Intalling configs for $dir..."
    
    mkdir -p ~/.config/$dir
    
    cp -r $DOTFILES_DIR/$dir/* ~/.config/$dir/
done

if [ -f "$DOTFILES_DIR/.bashrc" ]; then
    echo "Installing .bashrc..."
    cp $DOTFILES_DIR/.bashrc ~/.bashrc
fi

echo "Successfully! Reboot your session"
