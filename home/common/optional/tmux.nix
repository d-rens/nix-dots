{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    tmux
  ];
  programs.tmux = {
    enable = true;
    extraConfig = ''
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
      set -g prefix C-s
      set -g status-position top
    '';
  };
}
