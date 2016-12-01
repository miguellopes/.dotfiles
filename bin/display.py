#!/usr/bin/env python3
import subprocess
import sys

# just a helper function, to reduce the amount of code
get = lambda cmd: subprocess.check_output(cmd).decode("utf-8")

# get the data on all currently connected screens, their x-resolution
screendata = [l.split() for l in get(["xrandr"]).splitlines() if " connected" in l]
screendata = sum([[(w[0], s.split("+")[-2]) for s in w if s.count("+") == 2] for w in screendata], [])

def get_class(classname):
    # function to get all windows that belong to a specific window class (application)
    w_list = [l.split()[0] for l in get(["wmctrl", "-l"]).splitlines()]
    return [w for w in w_list if classname in get(["xprop", "-id", w])]

try:
    if len(screendata) == 1:
        jans = [l.split() for l in get(['wmctrl','-lG']).splitlines() if int(l.split()[1]) >= 0 ]
        for janela in jans:
            subprocess.Popen(["wmctrl", "-ir", janela[0], "-e", "0,100,100,"+janela[4]+","+janela[5]])

    # determine the left position of the targeted screen (x)
except IndexError:
    # warning if the screen's name is incorrect (does not exist)
    print( "Erro")
