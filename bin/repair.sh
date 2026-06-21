#!/bin/bash
# Run from ~/dotfiles after git pull: renames dir to .dotfiles and re-links everything
set -e

mv ~/dotfiles ~/.dotfiles
~/.dotfiles/bin/setup.sh
