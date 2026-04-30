#!/bin/bash

# Run with superuser
sudo apt update && sudo apt install -y zsh
chsh -s $(which zsh)
echo 'export ZDOTDIR="$HOME/.config/zsh"' > ~/.zshenv

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Plugins
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# For arc support check out https://github.com/misbiheyv/arc-zsh-plugin

rm ~/.zshrc
