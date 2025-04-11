# ~/.bashrc
export EDITOR='nvim'
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PS1='[\u@\h \W]\$ '

# Add Emacs/Doom to path
export PATH="$HOME/.emacs.d/bin:$PATH"
# Add .scripts dir to path
export PATH="$HOME/.scripts:$PATH"

# neovim as man page reader
# export MANPAGER="nvim +Man!"

### "less" as manpager
export MANPAGER "less"

# hyprshot dir env
export HYPRSHOT_DIR=/home/bledley/Pictures/Screenshots

HISTSIZE=100000

# vi mode in shell
set -o vi
bind -m vi-insert "\C-l":clear-screen

# wrap on window resize
shopt -s checkwinsize

# Aliases
alias ..="cd .."
alias cl="clear -x"
alias f="lf"
alias h="history | fzf"
alias iv="nsxiv"
alias lg="lazygit"
alias ff="clear && fastfetch"
alias open="xdg-open"
alias q="exit"
alias v="nvim"
alias z="zeditor"
# search for directory to cd into with fzf
alias sd="cd ~ && cd \$(find * -type d | fzf)"
alias sdn="shutdown -h now"
alias zat="zathura"
alias tree="tree -C" #colour for tree

# Emacs
# alias emacs="emacsclient -c -a 'emacs'"
alias e="emacsclient -nw"
alias ec='emacsclient -c -a ""'

# git abbrevs
alias gs='git status'
alias ga='git add -A'
alias gp='git push'
alias gpull='git pull'
alias gpo='git push origin main'
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff -M'
alias gf='git fetch'
alias gco='git checkout '
alias gl='git log --date-order --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'
alias glog='git log --graph --oneline --decorate'

# tmux
alias tmuxs="tmux-sessionizer.sh"
alias tmuxa="tmux attach"
alias tmuxd="tmux detach"
alias tmuxls="tmux ls"

# taskwarrior & tui
alias t="task"
alias ta="task add"
alias tt="taskwarrior-tui"

# ls command to eza for colours
alias dir="eza -a --color=always --sort Name"
alias l="eza -a --color=always --sort Name"
alias ls="eza -al --color=always --sort name --group-directories-first"
alias lm="eza -al --color=always --sort modified --reverse"
alias ll="eza -al --color=always --sort Name --group-directories-first --no-permissions --no-filesize --no-user --no-time"
alias la="eza -al --color=always --sort Name --group-directories-first"
alias lt="eza -aT --color=always --group-directories-first"
alias nmtrash="notmuch search --format=text0 --output=files tag:trash | xargs -0 --no-run-if-empty rm"

# Directory Shortcuts
alias sba="cd ~/sba/"
alias scrip="cd ~/.scripts/"
alias suck="cd ~/.config/suckless/"
alias doc="cd ~/Documents//"
alias dl="cd ~/Downloads/"
alias pic="cd ~/Pictures/"
alias .="cd ~/dotfiles/"
alias cfg="cd ~/.config/"
alias vid="cd ~/Videos/"
alias mus="cd ~/Music/"
alias org="cd ~/org/"
alias roam="cd ~/org/roam/"
alias day="cd ~/org/roam/daily/"
alias nn="v ~/org/roam/fleeting/$(date +%Y%m%d%H%M).org"

# Grep colours
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# Confirmation before overwrite
alias cp="cp -i -v"
alias mv="mv -i -v"
alias rm="rm -i -v"

# cmatrix
alias neo="neo --color=cyan"

# lf change directory
lf() {
    tmp="$(mktemp)"
    command lf -last-dir-path="$tmp" "$@"
    cd "$(cat "$tmp")"
    rm -f "$tmp" >/dev/null 2>&1
}

# fzf key bindings/fuzzy completion
eval "$(fzf --bash)"

# Starship prompt
eval "$(starship init bash)"
