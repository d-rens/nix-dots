{ config, pkgs, ...}:

{
  home.file = {
    ".config/fish/config.fish".source = ./configs/config.fish;
  };
  programs.fish = {
      interactiveShellInit = "fastfetch";
  };
}
