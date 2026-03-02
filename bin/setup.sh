#!/bin/bash
# Dotfiles Setup Script
# Creates symlinks from home directory to dotfiles in ~/dotfiles

# Exit on any error
set -e

echo "Setting up dotfiles..."

# Create necessary directories
mkdir -p ~/.config/tmux

# Create symlinks
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
echo "✓ Linked .gitconfig"

ln -sf ~/dotfiles/bashrc ~/.bashrc
echo "✓ Linked .bashrc"

rm -f ~/.config/nvim
ln -sf ~/dotfiles/nvim ~/.config/nvim
echo "✓ Linked nvim config"

ln -sf ~/dotfiles/tmux.conf ~/.config/tmux/tmux.conf
echo "✓ Linked tmux config"

ln -sf ~/dotfiles/.latexmkrc ~/.latexmkrc
echo "✓ Linked latexmkrc"

ln -sf ~/dotfiles/lilypond-make-standard.sh ~/.local/bin/lilymkstd
echo "✓ Linked lilypond-make-standard"

ln -sf ~/dotfiles/lilypond-compile.sh ~/.local/bin/lilycomp
echo "✓ Linked lilypond-compile"

ln -sf ~/dotfiles/ghostty/config ~/.config/ghostty/config
echo "✓ Linked ghostty config"

echo "Done! Dotfiles setup complete."
