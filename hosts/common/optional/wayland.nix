{ pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    foot
    grim
    mako
    river
    rofi-wayland
    slurp
    swaybg
    swayimg
    swaynotificationcenter
    waybar
    waylock
    wlr-randr
  ];

programs.river.enable = true;
}
