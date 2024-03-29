# alias
alias apigen="goctl api go -api *.api -dir ./  --style=goZero"
alias proxy="source /bin/proxy.sh"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias say="echo"
alias copy="xclip -selection clipboard"

# add debugging-pretty
alias dslogs="python ~/.pyScript/dslogs.py"
alias dstest="python ~/.pyScript/dstest.py"

# proxy setting
. /bin/proxy.sh set
export HOSTIP=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
export WSLIP=$(hostname -I | awk '{print $1}')

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
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
# zstyle ':omz:update' mode disabled  # disable automatic updates
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
# COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
		z
		sudo
		zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ccache
export PATH="/usr/lib/ccache:$PATH"
export NEMU_HOME=/home/loomt/CSLearning/PA/nemu
export AM_HOME=/home/loomt/CSLearning/NJUOS/os-workbench/abstract-machine
export ARCH=native

# go
export GOROOT=/usr/local/go
export GOPATH=/home/loomt/gopath
export GOBIN=$GOPATH/bin
export PATH=$GOPATH:$GOBIN:$GOROOT/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"

# nvm (nodejs version management)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

update_dockercfg(){
	cat > ~/.docker/config.json << EOF
{
  "proxies": {
    "default": {
      "http_proxy": "$HTTP_PROXY",
      "https_proxy": "$HTTP_PROXY",
      "noProxy": "localhost"
    }
  }
}
EOF
}

# ipfs
export CLUSTER_SECRET="4deadf7d09d140ec0e664aa56873e9bbfc8d0713144e39cd3babaf88ca549bab"
export LIBP2P_FORCE_PNET=1

alias dctl="/home/loomt/gopath/src/ipfs-cluster/cmd/ipfs-cluster-ctl/ipfs-cluster-ctl"
alias ictl="/home/loomt/gopath/src/ipfs-cluster/cmd/ipfs-cluster-ctl/ipfs-cluster-ctl --host /unix//home/loomt/.ipfs-cluster-follow/ali/api-socket"
alias isctl="/home/loomt/gopath/src/ipfs-cluster/cmd/ipfs-cluster-ctl/ipfs-cluster-ctl"
alias ifollow="/home/loomt/gopath/src/ipfs-cluster/cmd/ipfs-cluster-follow/ipfs-cluster-follow"
alias iservice="/home/loomt/gopath/src/ipfs-cluster/cmd/ipfs-cluster-service/ipfs-cluster-service"

alias cctl="ipfs-cluster-ctl"
alias cfollow="ipfs-cluster-follow"
alias cservice="ipfs-cluster-service"


export GOLOG_LOG_LEVEL="info,subsystem1=warn,subsystem2=debug"

alias dctlmake='
cd $GOPATH/src/ipfs-cluster/cmd/ipfs-cluster-ctl && make
cd $GOPATH/src/ipfs-cluster

docker build -t ipfs-cluster-erasure -f Dockerfile-erasure .
docker-compose -f docker-compose-erasure.yml up -d

docker logs -f cluster0 | tspin -c ~/.config/tailspin
'


dctltest() {
  cd $GOPATH/src/ipfs-cluster/cmd/ipfs-cluster-ctl && make
  cd $GOPATH/src/ipfs-cluster

  docker build -t ipfs-cluster-erasure -f Dockerfile-erasure .
  docker-compose -f docker-compose-erasure.yml up -d
    
	# QmSxdRX48W7PeS4uNEmhcx4tAHt7rzjHWBwLHetefZ9AvJ is the cid of tmpfile
  ci="QmSxdRX48W7PeS4uNEmhcx4tAHt7rzjHWBwLHetefZ9AvJ"
  dctl pin rm $ci

  seq 1 250000 > tmpfile
  dctl add tmpfile -n tmpfile --shard --shard-size 512000 --erasure #--erasure --data-shards 4 --parity-shards 2
  rm tmpfile

  # find frist peer no equal cluster0 and store sharding data
  # awk '$1 == 1 && $2 != 0 {print $2}' means that find the peer that store one shard and it's id not cluster0(cluster0 expose port)
  x=$(dctl status --filter pinned | grep cluster | awk -F'cluster' '{print $2}' | awk '{print $1}' | sort | uniq -c | awk '$1 == 3 && $2 != 0 {print $2}' | head -n 1)
  docker stop "cluster$x" "ipfs$x"

  dctl ipfs gc
  dctl status --filter pinned

  output=$(dctl ecrecovery | awk '{print $1}')

  if [ "$output" = "$ci" ]; then
    echo "The strings are equal, test pass."
  else
    echo "The strings are not equal, test fail."
  fi
}


docker_clean() {
	docker system prune -a
	docker image prune -a
	docker container prune -a
}

# rust
source "$HOME/.cargo/env"


