# tmux display things in 256 colors
set -g default-terminal "screen-256color"
set -g status-utf8 on
set -g history-limit 20000

# THEME
set -g @colors-solarized '256'

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

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'seebi/tmux-colors-solarized'
# # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
