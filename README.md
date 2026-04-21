# Configuration files for mainly used applications

## Create simlinks

Manage dotfiles with [stow](https://dev.to/crafts69guy/how-to-manage-your-dotfiles-like-a-pro-with-git-and-stow-3pg1)  
`sudo apt update && sudo apt install stow -y`

```bash
cd ~
mkdir -p ~/.config/nvim && stow -d ~/.dotfiles -t ~/.config/nvim nvim
mkdir -p ~/.config/alacritty && stow -d ~/.dotfiles -t ~/.config/alacritty alacritty
```