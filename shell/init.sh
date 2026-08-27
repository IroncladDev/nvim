# Bun
export PATH="$HOME/.bun/bin:$PATH"
export PATH="/home/ironcladdev/.cache/.bun/bin:$PATH"

alias y="yazi"
alias k="kubectl"

# keychain
eval $(keychain --eval --quiet id_ed25519)

# direnv
eval "$(direnv hook bash)"

# zoxide
if [ "$(uname -s)" = "Darwin" ]; then
    eval "$(zoxide init --cmd cd zsh)"
else
    eval "$(zoxide init --cmd cd bash)"
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi

sync-dotfiles() {
    echo "--> Syncing dotfiles"
    cd ~/.config
    jj f
    jj new master
    home-manager switch
    echo "--> Reloading shell"
    [ -f ~/.bashrc ] && source ~/.bashrc
    [ -f ~/.zshrc ] && source ~/.zshrc
}

killport() {
  if [ -z "$1" ]; then
    echo "Usage: killport <port>"
    return 1
  fi

  local pids
  pids=$(lsof -t -i:"$1" 2>/dev/null)

  if [ -z "$pids" ]; then
    echo "No process found on port $1"
    return 1
  fi

  echo "Killing process(es) on port $1 → $pids"
  kill -9 $pids
}

# writes the clipboard to the client clipboard with the osc52 drop-in
if [ "$(uname -s)" = "Darwin" ] && { [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_CLIENT" ]; }; then
    export PATH="$HOME/.config/shell/bin:$PATH"
fi

# Add 
# `source ~/.config/shell/init.sh`
# to the end of your ~/.bashrc or ~/.zshrc
