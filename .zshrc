# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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
export NOTES="$HOME/Notes"

# export JAVA_TOOL_OPTIONS="-Djava.awt.headless=true"

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

### docker-compose
alias dc="docker-compose"
alias dcd="docker-compose down"
alias dcl="docker-compose pull"
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"

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

alias gob="go build"
alias gof="go fmt"
alias gog="go get"
alias goi="go install"

export GOPATH=$CODE
export GOROOT=
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

#############################
### Python
#############################

### By default alias python to the system python3 install
### ( Some Pulsar packages rely on whatever `python` executes )
alias python="/usr/bin/python3"

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
source $KLAVIYO/infrastructure-deployment/bashenv/source.sh

### 8-hour long session by default
alias s2a-login="s2a-login --session-duration=28800"
alias s2a="s2a-login --session-duration=28800"

export PATH="/Users/david.reed/.klaviyocli/.bin:$PATH"
eval "$(_KLAVIYOCLI_COMPLETE=zsh_source klaviyocli)"

alias kcli="klaviyocli"

### Env Var Setup

for _kl_package in $(brew --prefix zlib lbzip2 bzip2 sqlite readline openssl@1.1 snappy libmemcached mysql@5.7); do
  if [[ ! -d "${_kl_package}" ]]; then
    echo "Package $(basename $_kl_package)'s path ${_kl_package} not found; try 'brew install'ing it. Klaviyo Python may not work well without this dependency." >&2
  fi
  export CFLAGS="${CFLAGS} -I${_kl_package}/include"
  export CPPFLAGS="${CPPFLAGS} -I${_kl_package}/include"
  export LDFLAGS="${LDFLAGS} -L${_kl_package}/lib"
done

# Based on which architecture you're on we need to set the ARCHFLAGS as well
if [[ "$(arch)" == "arm64" ]]; then
  export ARCHFLAGS="-arch arm64"
  export CFLAGS="$CFLAGS -maltivec"
else
  export ARCHFLAGS="-arch x86_64"
fi

# Make sure the xcode tools (OSX development headers) are locatable by scripts:
export SDKROOT=$(xcrun --show-sdk-path)
export CFLAGS="${CFLAGS} -I${SDKROOT}/usr/include"
export CPPFLAGS="${CFLAGS} -I${SDKROOT}/usr/include"
export LDFLAGS="${LDFLAGS} -L${SDKROOT}/usr/lib"
# Allows pip and some other package resolvers to correctly determine what OSX is running in compilation steps during
# installations, where otherwise they use flawed heuristics.
export MACOSX_DEPLOYMENT_TARGET=$(sw_vers -productVersion | cut -d'.' -f1-2)
# Allows low level debugger tools like py-spy to work with some pyenv-installed Pythons where they'd otherwise have
# trouble: (CAVEAT: do not use this on M1 machines)
if [[ "$(arch)" != "arm64" ]]; then
  export PYTHON_CONFIGURE_OPTS="--enable-framework"
fi


# Pulled from `python local app` => `python which python`
export MAINLINE_PYTHON="${/Users/david.reed/.pyenv/versions/app/bin/python}"
export KCLI_PYTHON_VERSION="3.10.9"

### Notes directory for Obsidian
export NOTES="$HOME/Documents/Klaviyo Vault/Klaviyo"

# Useful when installing virtualenv management outside of/before pyenv. Not using
# quotes permits tilde expansion.
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Useful for Docker
export CURRENT_UID="$(id -u):$(id -g)"

### For local dev, randomized MySQL password in a local file not in version control
# export KL_LOCAL_MYSQL_ROOT_PASSWORD=$(LC_ALL=C tr -dc 'A-Za-z0-9' </dev/urandom | head -c 20 ; echo)
source ~/dotfiles/db-secrets.zsh

