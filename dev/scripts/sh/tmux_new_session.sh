#!/bin/bash

pane_current_path="$(tmux display -p "#{pane_current_path}")"
session_name="$(basename "$pane_current_path" | sed 's/\./_/g')"

if ! tmux has-session -t "$session_name"; then
    if [[ -z "$VIRTUAL_ENV" ]]; then
        if [[ -d "$pane_current_path/.venv" ]]; then
            source "$pane_current_path/.venv/bin/activate"
        fi
    else
        parentdir="$(dirname "$VIRTUAL_ENV")"
        if [[ "$PWD"/ != "$parentdir"/* ]]; then
            deactivate
        fi
    fi
    tmux new -s "$session_name" -c "$pane_current_path" -d nvim
    tmux split-window -h -c "$pane_current_path"
fi

if [ -n "$TMUX" ]; then
    tmux switch-client -t "$session_name"
else
    tmux attach -t "$session_name"
fi
