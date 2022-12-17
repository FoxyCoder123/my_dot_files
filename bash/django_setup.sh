#!/bin/bash

#move to project directory
cd ~/djangoProjects/pyenv/.

tmux

#window 1
tmux rename-window -t 1 'project'
tmux send-keys -t 'project' 'source bin/activate.fish' C-m 'cd blogs/' C-m 'clear' C-m

#window 2
tmux new-window -t 2 -n 'code'
tmux send-keys -t 'code' 'source bin/activate.fish' C-m 'cd blogs/' C-m 'clear' C-m 'vim' C-m

#window 3
tmux new-window -t 3 -n 'server'
tmux send-keys -t 'server' 'source bin/activate.fish' C-m C-m 'cd blogs/' C-m 'clear' C-m 'python3 manage.py runserver'

#window 4
tmux new-window -t :4 -n 'templates'
tmux send-keys -t 'templates' 'source bin/activate.fish' C-m 'cd blogs/templates/' C-m 'clear' C-m
