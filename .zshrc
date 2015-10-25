export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="overblue"

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export PATH="/usr/local/bin:/usr/bin:/bin:/sbin:/opt/bin"

plugins=(git encode64 urltools vagrant web-search git-flow)

source $ZSH/oh-my-zsh.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source $HOME/.tmux_comms
source $HOME/.zsh_scripts
source $HOME/.aliases
export VISUAL="vim"

export SUDO_EDITOR="rvim"
export ARCHFLAGS="-arch x86_64"
#Carregar configs locais se existirem
if [ -f $HOME/.zsh_local ]; then
   source $HOME/.zsh_local
fi

