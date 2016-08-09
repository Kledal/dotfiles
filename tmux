set -g default-command "reattach-to-user-namespace -l zsh"
# tmux display things in 256 colors
set -g default-terminal "screen-256color"
#set -g status-utf8 on
set -g history-limit 20000

# Sane scrolling
#enable mouse support for switching panes/windows
setw -g mouse on
# set-option -g -q mouse on

bind-key -T root PPage if-shell -F "#{alternate_on}" "send-keys PPage" "copy-mode -e; send-keys PPage"
bind-key -t vi-copy PPage page-up
bind-key -t vi-copy NPage page-down

bind -T root WheelUpPane if-shell -F -t = "#{alternate_on}" "select-pane -t =; send-keys -M" "select-pane -t =; copy-mode -e; send-keys -M"
bind -T root WheelDownPane if-shell -F -t = "#{alternate_on}" "select-pane -t =; send-keys -M" "select-pane -t =; send-keys -M"
bind-key -t vi-copy WheelUpPane halfpage-up
bind-key -t vi-copy WheelDownPane halfpage-down

######################
#### Key bindings ####
######################
#split window and fix path for tmux 1.9
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# automatically renumber tmux windows
set -g renumber-windows on

# remap prefix to Control + a
set -g prefix C-a
unbind C-b
bind C-a send-prefix

# force a reload of the config file
unbind r
bind r source-file ~/.tmux.conf

# quick pane cycling
unbind ^A
bind ^A select-pane -t :.+

# smart pane switching with awareness of vim splits
bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-h) || tmux select-pane -L"
bind -n C-j run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-j) || tmux select-pane -D"
bind -n C-k run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-k) || tmux select-pane -U"
bind -n C-l run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-l) || tmux select-pane -R"
bind -n C-\ run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys 'C-\\') || tmux select-pane -l"

# Resize pane shortcuts
bind -r H resize-pane -L 10
bind -r J resize-pane -D 10
bind -r K resize-pane -U 10
bind -r L resize-pane -R 10

# Title
set-option -g set-titles on
set-option -g set-titles-string "#T - #W"

######################
#### DESIGN CHANGES ###
#######################
#+ window title:
set-option -g set-titles on
set-option -g set-titles-string '[#S:#I] #W'
set-window-option -g automatic-rename on

##+ messages:
set-window-option -g mode-bg magenta
set-window-option -g mode-fg black
set-option -g message-bg magenta
set-option -g message-fg black

##+ panes:
set-option -g pane-border-fg black
set-option -g pane-border-bg default
set-option -g pane-active-border-fg white
set-option -g pane-active-border-bg default

##+ status bar:
set-option -g status-justify right
set-option -g status-bg '#0e0e0e'
set-option -g status-fg '#222222'
set-option -g status-interval 5
set-option -g status-left-length 60
set-option -g status-left '#[fg=#222222]## #[fg=#555555]#T#[default]'
set-option -g status-right '#[fg=#333333]#S:#P#[default]'
set-option -g visual-activity on
set-window-option -g monitor-activity on
set-window-option -g window-status-current-bg '#0e0e0e'
set-window-option -g window-status-current-fg '#3d3a3a'
set-window-option -g window-status-bg '#0e0e0e'
set-window-option -g window-status-fg '#222222'

##+ clock:
set-window-option -g clock-mode-colour cyan
set-window-option -g clock-mode-style 24

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
# set -g @plugin 'seebi/tmux-colors-solarized'
# # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
