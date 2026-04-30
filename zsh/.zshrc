# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export PATH="$PATH:$HOME/.local/bin"

ZSH_THEME="gallois"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

zstyle ':omz:update' mode auto # update automatically without asking

# Aliases
alias set_keybright='sudo brightnessctl -d tpacpi::kbd_backlight set'
