# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Adding Doom Emacs to path
export PATH="$HOME/.emacs.d/bin:$PATH"
# Doom Emacs alias
#alias emacs="emacsclient -c -a 'emacs'"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# History in cache directory:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

ENABLE_CORRECTION="true"

# editor default
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=qutebrowser
export TERMINAL=kitty

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
 zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# PLUGINS
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting history-substring-search fzf)

source ~/.oh-my-zsh/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# User configuration

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#364949'


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#FZF - TODO alt-c show hidden directories?
#
export FZF_BASE="$HOME/.fzf.zsh"
DISABLE_FZF_AUTO_COMPLETION="true'"
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

##aliases
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias ..="cd .."
alias c="clear -x"
alias ct="clear -x && cat ~/Dropbox/roam/tasks.org"
alias cn="clear -x && neofetch"
alias open="xdg-open"
alias q="exit"
alias v="nvim"
alias vim="nvim"
alias oldvim="\vim"
#alias f="fzf"
alias f="ranger"
alias vfzf="nvim (fzf)"
#alias zat="zathura"
alias zrc="$EDITOR $HOME/.zshrc"
alias h="history | fzf"
alias qb="qutebrowser"
alias vn="v ~/Dropbox/roam/journals/$(date +%Y_%m_%d_%H%M).md"
alias ro="cd ~/Dropbox/roam/"
alias in="cd ~/Dropbox/0_Inbox/"
alias e="emacsclient -nw"
alias em="emacsclient -c -a 'emacs' &"
alias en="emacsclient -nw ~/Dropbox/roam/journals/$(date +%Y_%m_%d_%H%M).md"
#git
alias gs='git status'
alias ga='git add -A'
alias gp='git push'
alias gpo='git push origin main'
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gco='git checkout '
alias gl='git log'
alias glog='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'
#ls exa
alias l="exa -a --color=always --sort Name"
alias ls="exa -al --color=always --sort name --group-directories-first"
alias lm="exa -al --color=always --sort modified --reverse"
alias ll="exa -al --color=always --sort Name --group-directories-first --no-permissions --no-filesize --no-user --no-time"
alias la="exa -al --color=always --sort Name --group-directories-first"
alias lt="exa -aT --color=always --group-directories-first"

#shortcuts
alias bb="cd ~/bleds_blog/"
alias doc="cd ~/Documents/"
alias dl="cd ~/Downloads/"
alias pic="cd ~/Pictures/"
alias .="cd ~/dotfiles/"
alias cfg="cd ~/.config/"
alias vid="cd ~/Videos/"
alias mus="cd ~/Music/"
alias jou="cd ~/Dropbox/roam/journals/"
alias glo=glow
#grep color
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
#
#screen caffinate
alias cafon="xset s off -dpms && echo "Caffeine_ON""
alias cafoff="xset s on +dpms && echo "Caffeine_OFF""
##FZF
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--layout=reverse'
# tw
alias t="cat ~/Dropbox/roam/tasks.org"

#confirm before overwrite
alias cp="cp -i -v"
alias mv="mv -i -v"
alias rm="rm -i -v"

#lynx
alias lynx='lynx -vikeys -accept_all_cookies'

# CLI Pomodoro
declare -A pomo_options
pomo_options["Focus"]="30"
pomo_options["Break"]="15"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}m
  alert
  echo "Session Complete"
  notify-send "Session Complete"
  fi
}

alias focus="pomodoro 'Focus'"
alias break="pomodoro 'Break'"

alias nf="c && neofetch"
# vi mode 
bindkey -v
export KEYTIMEOUT=1
bindkey '^v' edit-command-line

# use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey "^?" backward-delete-char

# show hidden in tab completion
setopt globdots

#history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Ruby exports

export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

# Cli todo to Obsidian function
#function todo { echo "- [ ] $1" >> ~/Dropbox/roam/pages/TODO.md  }
function todo { echo "** TODO $1" >> ~/Dropbox/roam/inbox.org  }
#
# Fleeting Obsidian function
function note {
    echo "** $(date +%Y-%m-%d-%H:%M)\n-$@" >> ~/Dropbox/roam/inbox.org
}
#suppress warnings powerlevel10k
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
