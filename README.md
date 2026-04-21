# Configuration files for daily linux usage

## Create simlinks

`sudo apt update && sudo apt install stow -y`

```bash
cd ~
mkdir -p ~/.config/nvim && stow -d ~/.dotfiles -t ~/.config/nvim nvim
mkdir -p ~/.config/alacritty && stow -d ~/.dotfiles -t ~/.config/alacritty alacritty
```