# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

#############################
# Powerlevel10k
#############################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="robbyrussell" # "powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#############################
# ZSH Defaults
#############################

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
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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
source $ZSH/oh-my-zsh.sh
autoload -Uz compinit && compinit

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

### ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

### History
export HISTFILE=~/.history
export HISTSIZE=100000000
export SAVEHIST=$HISTSIZE
export HISTTIMEFORMAT="%F %d/%m/%y %T "
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_space

export CODE="$HOME/Code"
export SCRIPTS="$HOME/Scripts"
export PATH="$SCRIPTS:$PATH"

### Notes directory for Obsidian
# export NOTES="$HOME/Documents/Klaviyo Vault/Klaviyo"
export NOTES="$HOME/Notes"

# export JAVA_TOOL_OPTIONS="-Djava.awt.headless=true"

#############################
### Universal ZSH utils
#############################

### Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

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

# alias nuke_docker="docker stop $(docker ps -aq); docker rm $(docker ps -aq) && docker system prune -af --volumes"
function nuke_docker() {
  docker rm -f $(docker ps -aq); \
  docker rmi -f $(docker images -aq); \
  docker volume rm $(docker volume ls -q); \
  docker system prune -af --volumes; \
  docker builder prune -a -f; \
  docker network rm $(docker network ls -q)
}
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

### Kubernetes debugging
DEBUG_IMAGE="368154587575.dkr.ecr.us-east-1.amazonaws.com/klaviyo-python-debug:latest"
alias kdebug="kubectl debug $1 -it --image=$DEBUG_IMAGE"

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
### `go install golang.org/dl/go1.23.4@latest`
### `go1.23.4 download`
# alias go="go1.23.4"

### Go $PATH setup
export GOPATH=$CODE
export PATH=$PATH:$GOPATH/bin

export GOROOT=$(go env GOROOT)
export PATH=$PATH:$GOROOT/bin

export GOPROXY=https://proxy.golang.org,direct
export GOSUMDB=sum.golang.org

export GOTOOLCHAIN=auto

alias gob="go build"
alias gof="go fmt"
alias gog="go get"
alias goi="go install"

#############################
### Python
#############################

### By default alias python to the system python3 install
alias python="python3"

#############################
### NVM / NPM / Node
#############################

# NVM home directory
export NVM_DIR="$HOME/.nvm"

# Load NVM
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

# Load NVM bash_completion
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

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

# source ~/dotfiles/.klaviyo.zsh
