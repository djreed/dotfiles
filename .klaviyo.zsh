#############################
### Klaviyo
#############################

export KLAVIYO="$CODE/klaviyo"
export KL_APP="$KLAVIYO/Repos/app"
export KL_INFRA="$KLAVIYO/Repos/infrastructure-deployment"
export KL_KREPO="$KLAVIYO/Repos/k-repo"
export KL_NO_SET_S2A_PROMPT_COLORS=true
export KL_DISABLE_ELEVATED_PROMPT=true
export KL_SSH_USERNAME="davidreed"

### The infra-deployment script is lesser-updated, while
### .s2a_login was provided by the k-repo local setup script,
### so we'll source both based on recency
source $KLAVIYO/infrastructure-deployment/bashenv/source.sh
source $HOME/.s2a_login

### 8-hour long session by default
alias s2a="s2a-login --session-duration=28800"

export PATH="$HOME/.klaviyocli/.bin:$PATH"
eval "$(_KLAVIYOCLI_COMPLETE=zsh_source klaviyocli)"

alias kcli="klaviyocli"
alias kl="klaviyocli"

### Klaviyo Local Dev & Env Var Setup

# Soft limit on open file descriptors
ulimit -Sn 10240

# Sets up system and Python flags for Klaviyo Python (specifically in App)
# source $HOME/.apprc
source /Users/david.reed/.apprc
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# Pulled from `python local app` => `python which python`
# export MAINLINE_PYTHON=$HOME/.pyenv/versions/app/bin/python
export MAINLINE_PYTHON=/Users/david.reed/.pyenv/versions/app/bin/python
export KCLI_PYTHON_VERSION="3.10.9"
export PANTS_TEST_USE_COVERAGE=true

# Useful for Docker
export CURRENT_UID="$(id -u):$(id -g)"

### For local dev, randomized MySQL password in a local file not in version control
# export KL_LOCAL_MYSQL_ROOT_PASSWORD=$(LC_ALL=C tr -dc 'A-Za-z0-9' </dev/urandom | head -c 20 ; echo)
source ~/dotfiles/secrets.zsh

export CHARIOT_SETTINGS=/Users/david.reed/Klaviyo/Repos/k-repo/python/klaviyo/kms/config/settings/settings_development.py
export KL_AWS_CUSTOM_S3_ENDPOINT=http://localhost:9000
export KL_LOCAL_DYNAMODB_ENDPOINT=http://localhost:4566
export KL_LOCAL_KMS_ENDPOINT=http://localhost:4566
