{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    arandr
    sct
    slock
    unclutter
    xorg.libX11
    xorg.libX11.dev
    xorg.libXft
    xorg.libXinerama
    xorg.xkbcomp
    xorg.xmodmap
  ];
}
