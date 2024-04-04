#!/bin/sh
#xrandr -s 1920x1200
#xrandr --output HDMI-1 --primary --auto --output eDP-1 --mode 1920x1200 --scale 1x1 --right-of HDMI-1

#xrandr --dpi 250 --fb 6720x3960 \
#    --output eDP-1 --mode 2880x1800 \
#    --output HDMI-1 --primary --scale 2x2 --rate 165 --pos 2880x0 --panning 3840x2160+2880+0

#xrandr --output HDMI-1 --primary --left-of eDP-1
CONNECTED=$(xrandr -q | grep "connected" | wc -l)
[ $CONNECTED == 2 ] && xrandr --output HDMI-1 --mode "1920x1080" --primary --left-of eDP-1 --dpi 192
