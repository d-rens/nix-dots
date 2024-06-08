{ pkgs, configs, ... }:
{
  home.packages = with pkgs; [
    cinny-desktop
    element-desktop
    iamb
  ];
}
