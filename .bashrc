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

# vi mode in shell
set -o vi
bind -m vi-insert "\C-l":clear-screen

# wrap on window resize
shopt -s checkwinsize

# Aliases
alias ..="cd .."
alias cl="clear -x"
alias f="ranger"
alias h="history | fzf"
alias iv="nsxiv"
alias lg="lazygit"
alias nf="clear && neofetch"
alias open="xdg-open"
alias q="exit"
alias v="nvim"
alias z="zeditor"
# search for directory to cd into with fzf
alias sd="cd ~ && cd \$(find * -type d | fzf)"
alias sdn="shutdown -h now"
alias zat="zathura"

# Emacs
# Emacs always launches client if open (if not just emacs)
alias emacs="emacsclient -c -a 'emacs'"
# Emacs terminal mode
alias e="emacs -nw"
# Access dired directly from terminal
alias dired="emacsclient -c -a 'emacs' --eval '(dired nil)' & disown"

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

# set keyboard x
alias setus='setxkbmap -layout us'
alias setuk='setxkbmap -layout gb'
# alias setcap='setxkbmap -option caps:escape'

# tmux
alias ts="tmux-sessionizer.sh"
alias t="tmux"
alias ta="tmux attach"
alias td="tmux detach"
alias tls="tmux ls"

# ls command to exa for colours etc
alias dir="exa -a --color=always --sort Name"
alias l="exa -a --color=always --sort Name"
alias ls="exa -al --color=always --sort name --group-directories-first"
alias lm="exa -al --color=always --sort modified --reverse"
alias ll="exa -al --color=always --sort Name --group-directories-first --no-permissions --no-filesize --no-user --no-time"
alias la="exa -al --color=always --sort Name --group-directories-first"
alias lt="exa -aT --color=always --group-directories-first"

# Directory Shortcuts
alias sba="cd ~/sba/"
alias scripts="cd ~/.scripts/"
alias suck="cd ~/.config/suckless/"
alias doc="cd ~/Documents//"
alias dl="cd ~/Downloads/"
alias pic="cd ~/Pictures/"
alias .="cd ~/dotfiles/"
alias cfg="cd ~/.config/"
alias vid="cd ~/Videos/"
alias mus="cd ~/Music/"
alias notes="cd ~/Documents/zk/"
alias nn="v ~/Documents/zk/$(date +%Y%m%d%H%M).md"

# Grep colours
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# Screen on (Caffinate)
alias cafon="xset s off -dpms && echo "Caffeine_ON""
alias cafoff="xset s on +dpms && echo "Caffeine_OFF""

# Confirmation before overwrite
alias cp="cp -i -v"
alias mv="mv -i -v"
alias rm="rm -i -v"

# fzf key bindings/fuzzy completion
eval "$(fzf --bash)"

# Starship prompt
eval "$(starship init bash)"
