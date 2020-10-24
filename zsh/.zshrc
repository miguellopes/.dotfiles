export ZSH=$HOME/.oh-my-zsh

export ZSH_CUSTOM=$HOME/.my-zsh
ZSH_THEME="overblue"

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export PATH="/usr/local/bin:/usr/bin:/bin:/sbin:/opt/bin:~/.config/composer/vendor/bin"

plugins=(git encode64 urltools tmux git-flow)

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
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh



#if [[ -z "$TMUX" ]] ;then
#   ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
#   if [[ -z "$ID" ]] ;then # if not available create a new one
#      tmux new-session
#   else
#      tmux attach-session -t "$ID" # if available attach to it
#   fi
#fi

