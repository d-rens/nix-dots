{
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    kitty
  ];
  programs.kitty = {
    enable = true;
    settings = {
      # why is this here, stylix does that 
      background_opacity = lib.mkDefault "0.8";
    };
  };
}
