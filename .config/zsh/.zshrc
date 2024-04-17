# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

setxkbmap us -variant dvorak

# source
plug "$HOME/.config/zsh/functions.zsh"
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/confs.zsh"

# imports
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "jeffreytse/zsh-vi-mode"

# works form tmux
setopt share_history

# Load and initialise completion system
autoload -Uz compinit
compinit

# Change autosuggest key
bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

# run zoxide to look for file
bindkey -s '^V' 'cdi\n'
# lazygit
bindkey -s '^\' 'lazygit\n'
# vim
bindkey -s '^Z' 'nvim\n'
# tmux config
bindkey -s '^T' 't\n'
# oil
bindkey -s '^O' 'nvim .\n'

# opam configuration
[[ ! -r /home/sisoyyo/.opam/opam-init/init.zsh ]] || source /home/sisoyyo/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
