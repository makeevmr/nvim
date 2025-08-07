#!/bin/bash
# FILE: install.sh
# DESCRIPTION: Master setup script for neovim in docker with c++
# AUTHOR: Artem Makeev

# install directory
INSTALL_DIR="/root/nvim_docker/"

echo "Running Docker container setup..."

# Update XDG_CONFIG_HOME
export XDG_CONFIG_HOME="${INSTALL_DIR}.config"
export XDG_DATA_HOME="${INSTALL_DIR}.local/share"
export XDG_STATE_HOME="${INSTALL_DIR}.local/state"
export TERM="xterm-256color"

cd "$INSTALL_DIR"
rm -rf "${INSTALL_DIR}.config"
apt-get update

apt-get install -y wget curl git lsb-release software-properties-common gnupg
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
./llvm.sh 20
ln -s /usr/bin/clang-20 /usr/local/bin/clang
ln -s /usr/bin/clang++-20 /usr/local/bin/clang++
ln -s /usr/bin/clangd-20 /usr/local/bin/clangd
rm llvm.sh

# XCLIP 
apt-get install -y xclip

# NEOVIM
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
tar xzvf nvim-linux-x86_64.tar.gz
ln -s "${INSTALL_DIR}nvim-linux-x86_64/bin/nvim" /usr/local/bin/nvim
apt-get install -y python3-venv

# RIPGREP
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep_14.1.1-1_amd64.deb
apt-get install "./ripgrep_14.1.1-1_amd64.deb"

rm nvim-linux-x86_64.tar.gz
rm ripgrep_14.1.1-1_amd64.deb

# Git Repository (provided as an argument)
if [ -n "$1" ]; then
    git clone "$1" "${INSTALL_DIR}.config/nvim" 
else
    echo "Git repository URL not provided, proceeding without"
fi

# exit
cd ~
