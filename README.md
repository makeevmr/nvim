# Configuration files
Manage dotfiles with [stow](https://dev.to/crafts69guy/how-to-manage-your-dotfiles-like-a-pro-with-git-and-stow-3pg1)  
`sudo apt update && sudo apt install stow -y`

Clone project to home directory
```bash
cd ~
git@github.com:makeevmr/.dotfiles.git
```

## Create simlinks
`stow -d ~ -t ~/.config .dotfiles`