{ pkgs, config, ... }:
{
    home.packages = with pkgs; [
      calibre
    ];
}
