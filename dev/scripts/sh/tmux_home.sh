#!/bin/bash

if [ -z "$TMUX" ]; then
    if ! tmux has-session -t home 2>/dev/null; then
        tmux new-session -s home -d
        tmux split-window -t home:0 -h -p 12
        tmux send-keys -t home:0.0 'btm' C-m
    fi
    tmux attach -t home:0.1
fi
