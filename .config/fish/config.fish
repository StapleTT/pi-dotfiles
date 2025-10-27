set -g fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias history="history -r"
alias vim="nvim"
# alias mksh="~/importantscripts/mksh.sh"
# alias rm="~/importantscripts/logremove.sh"
alias ls="eza --icons"

# starship init fish | source
source (/usr/local/bin/starship init fish --print-full-init | psub)
