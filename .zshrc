# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k" #"robbyrussell"
# P10k configuration
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
source $ZSH/oh-my-zsh.sh
plugins=(
  bundler
  cp
  git
  git-extras
  github
  history
  rails
  zsh-syntax-highlighting
  zsh-kubectl-prompt
)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='emacsclient'
  export ALTERNATIVE_EDITOR='emacs'
fi


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# History
export HISTFILE=~/.history
export HISTSIZE=100000000
export SAVEHIST=$HISTSIZE
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_space

export GIT_HOME="~/Code/src/github.com/djreed/"

export NOTES="~/Notes/"

export CODE="~/Code/"

# export JAVA_TOOL_OPTIONS="-Djava.awt.headless=true"

export NVM_DIR="$HOME/.nvm"
source /usr/local/opt/nvm/nvm.sh
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Golang
export GOPATH=~/Code/

export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

# navigation shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# listing shortcuts
if [[ $(uname) == "Darwin" ]]; then
  alias l="ls -lAhG"
  alias la="ls -lAGh"
  alias ll="ls -lGh"
  alias ls="ls -Gh"
fi
if [[ $(uname) == "FreeBSD" ]]; then
  alias l="ls -lAhG"
  alias la="ls -lAGh"
  alias ll="ls -lGh"
  alias ls="ls -Gh"
fi
if [[ $(uname -a | grep Ubuntu) ]]; then
  alias l="ls -lah --color"
  alias la="ls -la --color"
  alias ll="ls -l --color"
  alias ls="ls --color"
fi

# git
alias g="git"
alias ga='git add'
alias gb='git branch'
alias gbs='git-branches'
alias gc='git commit -S'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gf='git fetch'
alias gl='git pull'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%aN>%Creset' --abbrev-commit"
alias glr='git pull --rebase'
alias gm='git merge'
alias gp='git push'
alias gr='git remote'
alias gs='git status'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gss='git stash save'

alias gp='git push'
alias gpo='git push origin'

# golang
alias gob="go build"
alias gof="go fmt"
alias gog="go get"
alias goi="go install"

# party parrot
alias celebrate="terminal-parrot -delay 50 -loops 3"
alias parrot="terminal-parrot"

# docker-compose
alias dc="docker-compose"
alias dcd="docker-compose down"
alias dcl="docker-compose pull"
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"

# docker
alias d="docker"
alias dim="docker images"
alias dps="docker ps"

# Tree
alias t='tree'
alias tl='tree | less'

# Maven
alias mcv='mvn clean verify'
alias mvc='mvn clean verify'
alias mc='mvn clean'
alias m='mvn'

# Colorized cat
alias c='highlight -O ansi'

# SSH as Root
function rootssh() {
  ssh $1 -t 'sudo su'
}

# Fuck
eval $(thefuck --alias)
alias re='fuck'

# GPG env vars
export GPG_TTY=$(tty)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Initialize rbenv
eval "$(rbenv init -)"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dreed/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dreed/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dreed/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dreed/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/opt/maven@3.5/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_211.jdk/Contents/Home
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/maven@3.5/bin:$PATH"

export DRIFT_HOME=~/Drift
alias tf=$DRIFT_HOME/platform-ops/bin/tf
alias tf_deploy=$DRIFT_HOME/platform-ops/bin/deploy
alias tf_assume_role=$DRIFT_HOME/platform-ops/bin/assume_role
alias tf_tail="$DRIFT_HOME/platform-ops/bin/tail_logs -u $(whoami)"
alias tf_debug="$DRIFT_HOME/platform-ops/bin/debug_container -u $(whoami)"
alias qa_creds="tf_assume_role qa ops-admin credstash getall"
alias prod_creds="tf_assume_role prod ops-admin credstash getall"

# Code search alias
cs () {
  query=${1// /%20} 
  echo "$query"
  open "https://code-search.drifttools.com/?q=$query&i=nope&files=&repos="
}

# Kube context swapping
export KUBECONFIG=$HOME/.kube/drift-eks
alias kops='kubectl config use-context drift-ops'
alias kqa='kubectl config use-context drift-qa'
alias kprod='kubectl config use-context drift-prod'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# added by travis gem
[ -f /Users/dreed/.travis/travis.sh ] && source /Users/dreed/.travis/travis.sh
