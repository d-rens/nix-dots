{ config, pkgs, ... }:

{
  imports = [
    ../common/core

<<<<<<< HEAD
    ../common/optional/academia
=======
<<<<<<< HEAD
>>>>>>> 5eb92aa (Added user to t470)
    ../common/optional/audio.nix
=======
    ../common/optional/academia
>>>>>>> feature/academia
    ../common/optional/git.nix
    ../common/optional/kitty.nix
    ../common/optional/mail.nix
    ../common/optional/matrix.nix
    ../common/optional/music.nix
    ../common/optional/newsboat.nix
    ../common/optional/tmux.nix
    ../common/optional/video.nix
    ../common/optional/zathura.nix

    ../common/optional/wayland
  ];

  home = {
    username = "da";
    homeDirectory = "/home/da";
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
