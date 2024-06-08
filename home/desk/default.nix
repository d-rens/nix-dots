{ config, pkgs, ... }:

{
  imports = [
    ../common/core

    ../common/optional/academia
    ../common/optional/tmux.nix
    ../common/optional/zathura.nix
  ];

  home = {
    username = "desk";
    homeDirectory = "/home/desk";
    stateVersion = "24.11";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  #hardware.pulseaudio.enable = false;

  programs = {
    home-manager.enable = true;
  };
}
