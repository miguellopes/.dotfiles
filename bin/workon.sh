#!/bin/sh

#incia ambiente webdev
wmctrl -s 1
exec chromium &
exec urxvt &
sleep 3
ST=`wmctrl -l |grep Chromium | cut -d" " -f1`
ter=`wmctrl -l |grep "1 bart miguellopes"| cut -d" " -f1`
posiciona_chrome() {
wmctrl -ir $ST -e 1,0,24,1200,1416
}
wmctrl -ir $ter -e 1,1200,24,2240,1390
