# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PS1='[\u@\h \W]\$ '
#! PS1="\w\n\e[1;34m$\e[m "
# PS1="\e[1;34m$\e[m "
#
# Add Emacs/Doom to path
export PATH="$HOME/.emacs.d/bin:$PATH"

HISTSIZE=100000

# vi mode
set -o vi
bind -m vi-insert "\C-l":clear-screen
# wrap on window resize
shopt -s checkwinsize

# add to todo function todo "text"
# todo() {
#   echo "TODO: $1" >> ~/vault/todo.md
# }

# Aliases
alias ..="cd .."
alias cl="clear -x"
alias nf="clear && neofetch"
alias open="xdg-open"
alias q="exit"
alias v="nvim"
alias f="ranger"
alias iv="nsxiv"
alias lg="lazygit"
alias emacs="emacsclient -c -a 'emacs'"
alias e="emacs -nw"
alias dired="emacsclient -c -a 'emacs' --eval '(dired nil)' & disown"
# alias sxiv="/usr/local/bin/nsxiv"
# alias nsxiv="/usr/local/bin/nsxiv"
alias sd="cd ~ && cd \$(find * -type d | fzf)"
alias zat="zathura"
alias h="history | fzf"
alias qb="qutebrowser"
alias sdn="shutdown -h now"
# git
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
alias tms="tmux-sessionizer.sh"
alias tm="tmux"
alias tma="tmux attach"
alias tmd="tmux detach"
alias tmls="tmux ls"
#ls exa
alias dir="exa -a --color=always --sort Name"
alias l="exa -a --color=always --sort Name"
alias ls="exa -al --color=always --sort name --group-directories-first"
alias lm="exa -al --color=always --sort modified --reverse"
alias ll="exa -al --color=always --sort Name --group-directories-first --no-permissions --no-filesize --no-user --no-time"
alias la="exa -al --color=always --sort Name --group-directories-first"
alias lt="exa -aT --color=always --group-directories-first"
alias mutt="neomutt"
# dir shortcuts
alias sba="cd ~/sba/"
alias scripts="cd ~/.scripts/"
alias suck="cd ~/.config/suckless/"
alias doc="cd ~/Library/"
alias dl="cd ~/Downloads/"
alias pic="cd ~/Pictures/"
alias .="cd ~/dotfiles/"
# alias termux="cd ~/dotfiles-termux/"
alias cfg="cd ~/.config/"
alias vid="cd ~/Videos/"
alias mus="cd ~/Music/"
alias vault="cd ~/vault/"
alias nn="v ~/vault/$(date +%Y%m%d%H%M).md"
# alias glo=glow
#grep color
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
#
#screen caffinate
alias cafon="xset s off -dpms && echo "Caffeine_ON""
alias cafoff="xset s on +dpms && echo "Caffeine_OFF""
#
#confirm before overwrite
alias cp="cp -i -v"
alias mv="mv -i -v"
alias rm="rm -i -v"

# is this working?
# source /usr/share/bash-completion/bash_completion
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
eval "$(starship init bash)"
