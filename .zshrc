# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lambda"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

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
plugins=(git brew ruby bundler)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8 export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim -v'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# My Aliases
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

#if [[ -x '/Applications/Emacs.app/Contents/MacOS/bin/emacsclient' ]]; then
#    export EDITOR='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
#else
#    export EDITOR="mvim -v"
#fi
# Custom Commands
prompt_rvm() {
    rbv=`rbenv version-name`
    rbv=${rbv#ruby-}
    echo $rbv
}
# mkdir && cd && git init
mdg(){
	mkdir "$*"
	cd "$*"
	git init
}

# nrp (new ruby project)
nrp(){
	mkdir "$*"
	cd "$*"
	mkdir lib spec
	git init
    rspec --init
    touch README.md
}

# update master
pm(){
  git checkout master
  git pull --ff-only
  ./script/bootstrap
}

# start sites development
start-sites(){
  aws-vault exec envato-sites-dev-rw --session-ttl=8h --assume-role-ttl=1h  -- ./script/start
}

# ctlr-z for fast switching
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
    zle redisplay
  else
    zle push-input
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

#vim
alias vim='mvim -v'

#emacs
if [[ -x '/Applications/Emacs.app/Contents/MacOS/bin/emacsclient' ]]; then
    alias e='emacs'
    alias emacs='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient --no-wait'
fi
#rspec
alias rsp='rspec -cfd'

#rails
alias bi='bundle install'
alias be='bundle exec'
alias rl='bin/rails'
alias rk='bin/rake'
# git alias
alias git='hub'
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit -S'
alias gb='git branch'
alias gd='git diff'
alias gco='git checkout'
alias grm='git rm'
alias gmv='git mv'
alias gup='git smart-pull'
alias gm='git smart-merge'
alias gl='git smart-log'

#Mocha
alias moc='mocha --compilers coffee:coffee-script/register'

#Docker
alias b2d='boot2docker'
alias dc='docker-compose'

# AWS
for profile in envato-customer-prod-power-user envato-customer-prod-read-only envato-customer-prod-cloudformation-user envato-market-development discovery-prod-cf envato-platform-production-cloudformation-user envato-customer-development-cloudformation-user; do
  alias aws-console-${profile}="open \$(aws-vault login ${profile})"
  alias aws-exec-${profile}="aws-vault exec ${profile} -- true && aws-vault exec ${profile} -- "
  alias aws-login-${profile}="eval \$(aws-exec-${profile} env | grep AWS | sed 's/^/export /g')"
  alias aws-clear-${profile}="security delete-generic-password -a '${profile}'"
done

alias awsi=aws-exec-identity-production
alias awsc=aws-exec-envato-customer-prod-cloudformation-user
alias awscp=aws-exec-envato-customer-prod-power-user
alias awsm=aws-exec-envato-market-development
alias awsd=aws-exec-discovery-prod-cf
alias awsp=aws-exec-envato-platform-production-cloudformation-user
alias awscd=aws-exec-envato-customer-development-cloudformation-user

# Setup zsh-autosuggestions
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/autosuggestions.zsh
source ~/.zsh/tmuxinator.zsh

# Enable autosuggestions automatically
 zle-line-init() {
    zle autosuggest-start
 }

zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export GOPATH=$HOME/src/go
export PATH=$HOME/.nodenv/bin:$GOPATH/bin:$PATH

eval "$(rbenv init -)"
eval "$(nodenv init -)"
eval "$(pyenv init -)"
eval "$(direnv hook zsh)"
export PATH=$HOME/.yarn/bin:$PATH

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
