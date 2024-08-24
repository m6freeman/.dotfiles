#!/bin/bash

if [ -n "$TMUX" ]; then

    pane_current_path="$(tmux display -p "#{pane_current_path}")"
    session_name="$(basename "$pane_current_path" | sed 's/\./_/g')"

    if ! tmux has-session -t "$session_name"; then
        tmux new -s "$session_name" -c "$pane_current_path" -d
    fi
    tmux switch-client -t "$session_name"
fi
