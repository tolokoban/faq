# Script qui lance des applications et les place sur les écrans

```bash
#!/bin/bash

# --- 1. Launch Applications ---
thunderbird &
google-chrome "https://teams.cloud.microsoft/" &
code &
firefox &


# --- 2. Wait for windows to actually open ---
sleep 2

activate() {
  WID=$(xdotool search --onlyvisible --class "$1" | head -1)
  xdotool windowactivate $WID
}

# Usage: wmctrl -r "Window Name" -e gravity,X,Y,width,height
# Note: 0,0 is the top-left corner of your primary monitor.

wmctrl -r "Thunderbird" -b remove,maximized_vert,maximized_horz
wmctrl -r "Thunderbird" -e 0,-1000,100,400,400
activate "Thunderbird"
xdotool key Super+Right # Right-half screen

wmctrl -r "Chrome" -b remove,maximized_vert,maximized_horz
wmctrl -r "Chrome" -e 0,-1000,100,400,400
activate "Chrome"
xdotool key Super+Left  # Left-half screen

wmctrl -r "Firefox" -b remove,maximized_vert,maximized_horz
wmctrl -r "Firefox" -e 0,2000,0,640,480
activate "Firefox"
xdotool key Alt+F10  # Fullscreen
```

----

[Retour](../README.md)
