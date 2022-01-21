# Path to your oh-my-bash installation.
export OSH=/home/migbert/.oh-my-bash

OSH_THEME="powerline-multiline"
CASE_SENSITIVE="true"
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

completions=(
  git
  composer
  ssh
  pip
  pip3
  bash
)
aliases=(
  general
)
plugins=(
  git
  bashmarks
  npm
  nvm
  progress
  aws
)

source $OSH/oh-my-bash.sh
# You may need to manually set your language environment
export LANG=es_ES.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias update='sudo pacman -Sy'
alias upgrade='sudo pacman -Syu'
alias instalar='sudo pacman -Sy '
alias upgradepower='sudo powerpill -Syyu'
alias pacmanclean='sudo pacman -Scc'
alias gitl='git log --oneline --graph'
alias gits='git status -sb'
alias vv=nvim
# alias vim=nvim
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.config/composer/vendor/bin

#####
# ENTORNO VIRTUAL DE DESARROLLO DE PYTHON
#####
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/www
# source /usr/bin/virtualenvwrapper.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export EDITOR="$(if [[ -n $DISPLAY ]]; then echo 'leafpad'; else echo 'nvim'; fi)"
export VISUAL="nvim"
