#!/bin/bash
## create a session and attach to it with tmux
tmux has-session -t painless

if [[ $? != 0 ]]
then
  # change directory to $HOME/tmux so the new sessions starts there
  cd ~/tmux
  # detach from tmux (if you are attached, but you shouldn't >_<)
  tmux detach
  # create session "painless" (-s) and window "editor" (-n), then detach (-d)
  tmux new-session -s painless -n editor  -d
  # split the window horizontally in painless session (40% of the screen)
  tmux split-window -h -p 40 -t painless
  # -t let you talk to an specific pane Session:WindowIndex.PaneIndex. C-m is <enter>
  tmux send-keys -t painless:0.0 'vim' C-m
fi
tmux attach -t painless
