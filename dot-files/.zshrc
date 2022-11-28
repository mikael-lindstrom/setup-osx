export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
#ZSH_THEME="robbyrussell"

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
plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set default editor
export EDITOR="nvim"

# agnoster theme removes user@host from prompt if user is DEFAULT_USER
DEFAULT_USER="mikael"

# Enable homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Enable direnv
eval "$(direnv hook zsh)"

# Enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable zoxide
eval "$(zoxide init zsh)"

# Use yubikey for aws-vault
export AWS_VAULT_PROMPT=ykman

# Add vault and expiry time for aws-vault to RPROMPT
function set_vaulted_rprompt() {
  local DIFF=$((($(date -u -j -f "%Y-%m-%dT%TZ" "$AWS_SESSION_EXPIRATION" +%s) - $(date +%s))))
  if [[ "$DIFF" -le 0 ]]; then
    echo "$AWS_VAULT Expired"
  else
    echo "$AWS_VAULT $(($DIFF/60))m$(($DIFF%60))s"
  fi
}

if [[ $AWS_VAULT ]] && [[ $AWS_SESSION_EXPIRATION ]]; then
  export RPROMPT='$(set_vaulted_rprompt)'
fi

# Setup GOPATH
export GOPATH="$HOME/code"
export PATH="$GOPATH/bin:$PATH"

# Setup rust
source "$HOME/.cargo/env"

# Alias setup
alias vim=nvim
alias cat=bat

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
bindkey "^W" backward-kill-word
