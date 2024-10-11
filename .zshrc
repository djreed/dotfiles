# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=robbyrussell

##################################
# ZSH Defaults
##################################

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::archlinux
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

### Theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

### History
export HISTFILE=~/.history
export HISTSIZE=100000000
export SAVEHIST=$HISTSIZE
export HISTTIMEFORMAT="%F %d/%m/%y %T "

### ZSH options
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt inc_append_history

### Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

### Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

### User configuration
export MANPATH="/usr/local/man:$MANPATH"

### You may need to manually set your language environment
export LANG=en_US.UTF-8

### Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='emacsclient'
  export ALTERNATIVE_EDITOR='emacs'
fi

### Compilation flags
# export ARCHFLAGS="-arch x86_64"

### SSH
export SSH_KEY_PATH="~/.ssh/rsa_id"

### Shortcuts
export CODE="$HOME/Code"
export SCRIPTS="$HOME/Scripts"
export PATH="$SCRIPTS:$PATH"

### Notes directory for Obsidian
export NOTES="$HOME/Documents/Klaviyo Vault/Klaviyo"
# export NOTES="$HOME/Notes"

### Less mouse support by default
export LESS='-RiF --mouse --wheel-lines=3'

#############################
### Universal ZSH utils
#############################

### navigation shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

### listing shortcuts
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

# ### Tree
# alias t='tree'
# alias tl='tree | less'

### Colorized cat
alias c='highlight -O ansi'

### SSH as Root
function rootssh() {
  ssh $1 -t 'sudo su'
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#############################
### Command line tooling
#############################

### LaTeX (for pdflatex)
# export PATH="/usr/local/texlive/2023/bin/universal-darwin:$PATH"

### party parrot
alias celebrate="terminal-parrot -delay 50 -loops 3"
alias parrot="terminal-parrot"

### GPG env vars
export GPG_TTY=$(tty)

#############################
### tmux
#############################

alias t="tmux"

alias td="tmux detach"
alias ta="tmux attach"
alias detach="tmux detach"
alias attach="tmux attach"

alias tn="tmux new-session"

alias tl='tmux ls'
alias tls="tmux ls"

#############################
### git[hub] tooling
#############################

alias g="git"
alias ga='git add'
alias gaa='git add --all'
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

alias stash='git stash'
alias pop='git stash pop'

alias gp='git push'
alias gpo='git push origin'
alias gposu='git push --set-upstream origin'

#############################
### docker and docker-compose tooling
#############################

### docker
alias d="docker"
alias dim="docker images"
alias dps="docker ps"

### docker compose (formerly docker-compose)
alias dc="docker compose"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcl="docker compose pull"
alias dcud="docker compose up -d"

alias nuke_docker="docker stop $(docker ps -aq); docker rm $(docker ps -aq) && docker system prune -af --volumes"
alias docker_nuke="nuke_docker"

#############################
### Kubectl / Drift clusters
#############################

### Kube shortcuts and context swapping
# export KUBECONFIG=$HOME/.kube/drift-eks
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kc='kubectl config'

alias kns='kubectl config set-context $(kubectl config current-context) --namespace '
alias kgp='kubectl get pods'
alias kgd='kubectl get deploy'
alias kgi='kubectl get ingress'
alias kgs='kubectl get service'
alias kgn='kubectl get nodes'
alias kdp='kubectl get pod'
alias kexec='kubectl exec -ti '
alias klog='kubectl logs'

alias kcluster='kubectl config use-context'
alias kcontext='kubectl config use-context'

### Get node CPU and Mem usage
alias kutil='kubectl get nodes --no-headers | awk '\''{print $1}'\'' | xargs -I {} sh -c '\''echo {} ; kubectl describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo '\'''

### Istio shortcuts
alias i='istioctl'
alias ist='istioctl'
alias istio='istioctl'

### EKS shortcuts
alias eks='eksctl'
alias eg='e get'

#############################
### Java / Maven
#############################

### Maven
alias mvn_clean_install="mvn clean install -U -Dmaven.test.skip=true"
alias mcv='mvn clean verify'
alias mvc='mvn clean verify'
alias mc='mvn clean'
alias m='mvn'

#############################
### Golang
#############################

### Golang version selection
### See: https://go.dev/doc/manage-install
### Can install multiple versions at a time, e.g.
### `go install golang.org/dl/go1.19@latest`
### `go1.19 download`
alias go="go1.22.2"

### Go $PATH setup
export GOPATH=$CODE
export PATH=$PATH:$GOPATH/bin

export GOROOT=$(go env GOROOT)
export PATH=$PATH:$GOROOT/bin

alias gob="go build"
alias gof="go fmt"
alias gog="go get"
alias goi="go install"

#############################
### Python
#############################

### By default alias python to the system python3 install
### ( Some Pulsar packages rely on whatever `python` executes )
alias python="python3"

#############################
### NVM / NPM / Node
#############################

# NVM home directory
export NVM_DIR="$HOME/.nvm"

# Load NVM
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# Load NVM bash_completion
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" 

# Post-NVM-initialization
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

#############################
### Klaviyo
#############################

export KLAVIYO="$CODE/klaviyo"
export KL_APP="$KLAVIYO/app"
export KL_NO_SET_S2A_PROMPT_COLORS=true
export KL_DISABLE_ELEVATED_PROMPT=true
export KL_SSH_USERNAME="davidreed"

### The infra-deployment script is lesser-updated, while
### .s2a_login was provided by the k-repo local setup script,
### so we'll source both based on recency
source $KLAVIYO/infrastructure-deployment/bashenv/source.sh
source $HOME/.s2a_login

### 8-hour long session by default
alias s2a-login="s2a-login --session-duration=28800"
alias s2a="s2a-login --session-duration=28800"

export PATH="$HOME/.klaviyocli/.bin:$PATH"
eval "$(_KLAVIYOCLI_COMPLETE=zsh_source klaviyocli)"

alias kcli="klaviyocli"
alias kl="klaviyocli"

### Klaviyo Local Dev & Env Var Setup

# Soft limit on open file descriptors
ulimit -Sn 10240

# Sets up system and Python flags for Klaviyo Python (specifically in App)
source $HOME/.apprc
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# Pulled from `python local app` => `python which python`
export MAINLINE_PYTHON=$HOME/.pyenv/versions/app/bin/python
export KCLI_PYTHON_VERSION="3.10.9"

export CHARIOT_SETTINGS=$KLAVIYO/k-repo/python/klaviyo/kms/config/settings/settings_development.py

# Useful for Docker
export CURRENT_UID="$(id -u):$(id -g)"

### For local dev, randomized MySQL password in a local file not in version control
# export KL_LOCAL_MYSQL_ROOT_PASSWORD=$(LC_ALL=C tr -dc 'A-Za-z0-9' </dev/urandom | head -c 20 ; echo)
source $HOME/dotfiles/secrets.zsh

# Macro to check traffic on a DB before deletion
pre-delete() {
  aws cloudwatch get-metric-statistics --namespace AWS/RDS --metric-name DatabaseConnections --dimensions "[{\"Name\": \"DBClusterIdentifier\", \"Value\": \"$1\"}]" --start-time $(date -v-1d -u +"%Y-%m-%dT%H:%M:%SZ") --end-time $(date -u +"%Y-%m-%dT%H:%M:%SZ") --period 3600 --statistics Average | jq '.Datapoints[].Average'
}

# list all hosts from a certain cluster
function list-cluster() {
  aws ec2 describe-instances --filters \
    "Name=tag:cluster,Values=$1" \
    'Name=instance-state-name,Values=running' \
    | jq -r '.Reservations[].Instances[]' \
    | jq -r '.Tags[] | select(.Key == "Name") | .Value'
}
