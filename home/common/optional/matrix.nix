{ pkgs, configs, ... }:
{
  home.packages = with pkgs; [
    iamb
  ];
}
