#!/bin/sh
if [ -z "$1" ]
then
	find . -maxdepth 2 -name ".*" ! -name '.git*' ! -name '.' ! -name '..' -exec ln -s -f $PWD/{} --target-directory=$HOME \;
else
	scp -r $PWD $1:~/
	echo git remote add NOME ssh://MAQUINA/home/USER/.dotfiles/git
fi

