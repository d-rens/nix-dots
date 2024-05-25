{ config, pkgs, ...}:

{
  home.file = {
    ".config/kitty/kitty.conf".source = ../configs/kitty/kitty.conf;
  };
}
