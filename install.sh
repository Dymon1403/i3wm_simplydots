#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
DIRS=("alacritty" "i3" "nvim" "picom" "polybar")

mkdir -p ~/.config

for dir in "${DIRS[@]}"; do
    if [ -d "$DOTFILES_DIR/$dir" ]; then
        if [ -d "$HOME/.config/$dir" ]; then
            cp -r "$HOME/.config/$dir" "$HOME/.config/${dir}.bak"
            rm -rf "$HOME/.config/$dir"
        fi
        
        cp -r "$DOTFILES_DIR/$dir" "$HOME/.config/"
    else
        echo "==> Warning: $dir not found in repo, skipping." 
    fi
done

if [ -f "$DOTFILES_DIR/.bashrc" ]; then
    [ -f "$HOME/.bashrc" ] && cp "$HOME/.bashrc" "$HOME/.bashrc.bak"
    cp "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
fi

echo "==> Successfully installed! Restart your i3 session (Mod+Shift+R)."
