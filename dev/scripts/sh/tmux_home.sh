#!/bin/bash

if ! tmux has-session -t home; then
    tmux new -s home -d
    tmux split-window -t home:0 -v
    tmux split-window -t home:0.0 -h
    tmux split-window -t home:0.2 -h
    tmux send-keys -t home:0.0 'btm' Enter
    tmux send-keys -t home:0.2 'cmus' Enter
    tmux send-keys -t home:0.3 'vifm' Enter
    tmux resize-pane -t home:0.1 -x 8 -y 16
fi
tmux attach -t home:0.1
