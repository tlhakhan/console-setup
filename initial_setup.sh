#!/bin/bash

echo "Installing packages"
sudo apt-get install -y vim git tmux mosh python3-pip python3-venv

echo "Setting up gitconfig"
test -e ~/.gitconfig || cat <<EOF > ~/.gitconfig
[user]
  name = Tenzin Lhakhang
  email = 2402007+tlhakhan@users.noreply.github.com
EOF

echo "Setting up tmux.conf"
test -e ~/.tmux.conf || cat <<'EOF' > ~/.tmux.conf
bind r source-file ~/.tmux.conf \; display "Reloaded!"

set -g mouse off
set -g default-terminal "xterm"

# bar style
set -g status-style fg=white,bold,bg=black
setw -g window-status-style fg=cyan,bg=black
setw -g window-status-current-style fg=white,bold,bg=red

# clock-style
set -g status-right "#[fg=cyan]%A, %b %d %Y %I:%M %p"

# for pane
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5
EOF

echo "Setting up vimrc"
test -e ~/.vimrc || cat << 'EOF' > ~/.vimrc
set tabstop=2 softtabstop=2 expandtab shiftwidth=2

set nocompatible
syntax enable
filetype plugin on

set number

set path+=**
set wildmenu

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
EOF

# Initial venv setup
echo "Setting up the .venv"
test -d ~/.venv || python3 -m venv ~/.venv
source ~/.venv/bin/activate
