#!/bin/sh
SHH=`echo $SHELL | cut -d"/" -f3`
SHL="zsh"
if [ -z "$1" ]
then
   ls README.md > /dev/null 2>&1
   if [ "$?" != "0" ]; then
      echo "A extrair repositorio."
      git checkout .
   fi
   ls zsh/.oh-my-zsh/oh-my-zsh.sh > /dev/null 2>&1
   if [ "$?" != "0" ]; then
      echo "A atualizar submodulos."
      git submodule init 
      git submodule update
   fi
	find . -maxdepth 2 -name ".*" ! -name '.git*' ! -name '.' ! -name '..' -exec ln -s -f $PWD/{} $HOME/ \;
else
   rsync -avzr $PWD/.git $1:~/.dotfiles/
   rsync -avzr $PWD/$0 $1:~/.dotfiles/
fi

