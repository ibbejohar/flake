{ config, pkgs, ... }:


{

  programs.tmux = {

    enable = true;
    mouse = true;
    terminal = "screen-256color";
    extraConfig = ''
      set-option -gas terminal-overrides "*:Tc"
      set-option -gas terminal-overrides "*:RGB"
      set-option -g status-position top
      set -g renumber-windows on
      set -g prefix C-s
      set -g base-index 1
      set -s escape-time 0
      setw -g pane-base-index 1

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      set -g @minimal-tmux-status "top"
      set -g @minimal-tmux-justify "left"
      set -g @minimal-tmux-indicator false


      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'niksingh710/minimal-tmux-status'
      run '~/.config/tmux/plugins/tpm/tpm'
     '';
   };

}

