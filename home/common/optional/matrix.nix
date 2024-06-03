{ pkgs, configs, ... }:
{
  home.packages = with pkgs; [
    cinny-desktop
    iamb
  ];
}
