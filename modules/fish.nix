{ config, pkgs, ...}:

{
  home.file = {
    ".config/fish/config.fish".source = ../configs/fish/config.fish;
  };
  programs.fish = {
      interactiveShellInit = "fastfetch";
  };
}
