#!/bin/sh
# Hamsket first as it takes a while
/opt/Hamsket/hamsket &>/dev/null &
while $(wmctrl -l | grep -q "Hamsket"); do
  sleep 0.1
done

# This terminal
wmctrl -r "/bin/bash" -b remove,maximized_vert,maximized_horz
wmctrl -r "/bin/bash" -e 0,1930,1024,1080,932

# Firefox
firefox &>/dev/null &
while $(wmctrl -l | grep -q "Mozilla Firefox"); do
  sleep 0.1
done
wmctrl -r "Mozilla Firefox" -b remove,maximized_vert,maximized_horz
wmctrl -r "Mozilla Firefox" -e 0,0,0,1024,720
wmctrl -r "Mozilla Firefox" -b add,maximized_vert,maximized_horz

# Google chrome
google-chrome &>/dev/null &
while $(wmctrl -l | grep -q "Google Chrome"); do
  sleep 0.1
done
wmctrl -r "Google Chrome" -b remove,maximized_vert,maximized_horz
wmctrl -r "Google Chrome" -e 0,4000,500,1024,720
wmctrl -r "Google Chrome" -b add,maximized_vert,maximized_horz

# Finally, hamsket again
sleep 3
wmctrl -r "Hamsket" -b remove,maximized_vert,maximized_horz
wmctrl -r "Hamsket" -e 0,1930,0,1080,932
