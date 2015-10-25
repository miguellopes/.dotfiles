#!/bin/sh
if [ -z "$1" ]
  then
      find ~/.dotfiles -maxdepth 1 -name ".*" ! -name '.git' ! -name '.' ! -name '..' -exec ln -s -f {} --target-directory=$HOME \;
   else
      scp -r $PWD $1:~/
      echo git remote add NOME ssh://MAQUINA/home/USER/.dotfiles/git
   fi

