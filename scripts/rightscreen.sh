#!/bin/sh

declare awesomePID=$(pgrep awesome)

xrandr --output eDP1 --primary --mode 1600x900 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --mode 1024x768 --pos 1600x132 --rotate normal --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off

# Reinicia awesomeWM
kill -HUP $awesomePID
