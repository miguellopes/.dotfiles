#!/bin/bash

#incia ambiente webdev
posiciona_chrome() {
   wmctrl -ir $ST -e 1,0,22,1200,1418
}
posiciona_term() {
   wmctrl -ir $ter -e 1,1200,22,2240,1392
}
wmctrl -s 1
wmctrl -l
ST=`wmctrl -l |grep Chromium | cut -d" " -f1`
ter=`wmctrl -l |grep "1 bart miguellopes"| cut -d" " -f1`
ter2=`wmctrl -l |grep "1 bart _zsh_tmux_plugin"| cut -d" " -f1`
if [ -z "$ST" ]; then
   exec chromium &
fi
if [ -z "$ter2" ]; then
   if [ -z "$ter" ]; then
      echo "term nao encontrado"
      exec gnome-terminal &
      sleep 2
      ter=`wmctrl -l |grep "1 bart miguellopes"| cut -d" " -f1`
   fi
else
   ter=$ter2
fi

ST=`wmctrl -l |grep Chromium | cut -d" " -f1`
if [ -z "$ST" ]; then
sleep 3
fi

posiciona_chrome
posiciona_term

