#! /usr/bin/python2.7

# tiling.py
# Simple tiling for GTK

from gtk.gdk import *
import argparse

TOP_BAR = 22  # Put the height of your title bar here
TITLE_BAR = 31  # Put the height of your title bar here

# Parse the command line arguments

parser = argparse.ArgumentParser(description="Simple tiling for GTK")
parser.add_argument("w", type=str,
        help="Frame width (in percentage of screen width)")
args = parser.parse_args()

win = window_foreign_new((get_default_root_window()
    .property_get('_NET_ACTIVE_WINDOW')[2][0]))
state = win.property_get('_NET_WM_STATE')[2]

screen_width = screen_width()
screen_height = screen_height()
L = 1120+1200
# Get the screen's width and height
if args.w == "TR":
    win.move_resize(L,TOP_BAR,1120,(screen_height/2)-TOP_BAR-TITLE_BAR)
if args.w == "BR":
    win.move_resize(L,(screen_height/2),1120,(screen_height/2)-TITLE_BAR)
if args.w == "R":
    win.move_resize(L,TOP_BAR,1120,1418-TITLE_BAR)
if args.w == "L":
    win.move_resize(0,TOP_BAR,1120,1418-TITLE_BAR)
if args.w == "TL":
    win.move_resize(0,TOP_BAR,1120,(screen_height/2)-TOP_BAR-TITLE_BAR)
if args.w == "BL":
    win.move_resize(0,(screen_height/2),1120,(screen_height/2)-TITLE_BAR)
if args.w == "C":
    win.move_resize(1121,TOP_BAR,1199,(screen_height)-TOP_BAR-TITLE_BAR)

#
## Calculate the frame dimensions and location in pixels
#
#w = int(round(args.w / 100.0 * screen_width))
#h = int(round(args.h / 100.0 * screen_height))
#x = int(round(args.x / 100.0 * screen_width))
#y = int(round(args.y / 100.0 * screen_height))+TOP_BAR
#
## Check whether decorations are desired

#if args.d == 1:
#    win.set_decorations(DECOR_TITLE)  # or DECOR_ALL for all decorations
#    win.move_resize(x, y, w, (h - TITLE_BAR))
#if args.d == 0:
#    win.set_decorations(0)
#    win.move_resize(x, y, w, h)

    # Apply changes to window

window_process_all_updates()
flush()
