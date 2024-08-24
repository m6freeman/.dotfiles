#!/bin/bash

i3-msg workspace 10
alacritty -e zsh -c 'i3-msg fullscreen;
                        sleep 0.5;
                        cmatrix -b -C cyan' &
i3lock -n -u -e -p win
i3-msg kill
i3-msg workspace 1
