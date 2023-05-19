if [ -n "$TMUX" ]; then
  white='#f8f8f2'
  gray='#44475a'
  dark_purple='#6272a4'

  if [ "$1" = "attach" ]; then  
    tmux set-window-option -q window-status-format "#[fg=${white}]#[bg=${gray}] #I ${PWD##/*/} "
    tmux set-window-option -q window-status-current-format "#[fg=${white},bg=${dark_purple}] #I ${PWD##/*/} "
  else 
    tmux set-window-option -q window-status-format "#[fg=${white}]#[bg=${gray}] #I #{b:pane_current_path}  "
    tmux set-window-option -q window-status-current-format "#[fg=${white},bg=${dark_purple}] #I #{b:pane_current_path} "  
  fi
fi