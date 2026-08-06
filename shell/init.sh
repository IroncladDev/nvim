# Bun
export PATH="$HOME/.bun/bin:$PATH"
export PATH="/home/ironcladdev/.cache/.bun/bin:$PATH"

alias y="yazi"
alias k="kubectl"

# keychain
eval $(keychain --eval --quiet id_ed25519)

# direnv
eval "$(direnv hook bash)"

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

# writes the clipboard to the client clipboard with the osc52 drop-in
if [ "$(uname -s)" = "Darwin" ] && { [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_CLIENT" ]; }; then
    export PATH="$HOME/.config/shell/bin:$PATH"
fi

# Add 
# `source ~/.config/shell/init.sh`
# to the end of your ~/.bashrc or ~/.zshrc
