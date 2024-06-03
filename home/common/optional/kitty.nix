{ config, pkgs, lib, ...}:

{
  home.packages = with pkgs; [
    kitty
  ];
  programs.kitty = {
    enable = true;
    settings = {
      #font_size = 10;
      background_opacity = lib.mkDefault "0.8";
    };
  };
}
