#!/bin/bash
# create screenshot by ulauncher shortcut
# e.g. "snip" keyword in ulauncher + parameter "-a" for area selection
gnome-screenshot -f ~/images/screenshot-$(date +%Y%m%d_%H%M%S).png $@
