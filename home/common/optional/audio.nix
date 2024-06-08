{ pkgs, config, ... }:
{
    home.packages = with pkgs; [
      audacity
    ];
}
