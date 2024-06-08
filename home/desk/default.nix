{ config, pkgs, ... }:

{
  imports = [
    ../common/core

    ../common/optional/texlive.nix
    ../common/optional/tmux.nix
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

  programs = {
    home-manager.enable = true;
  };
}
