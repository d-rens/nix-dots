{ pkgs, config, ... }:
{
  imports = [
    ./lf
    ./nvim
    ./browsing.nix
    ./fish.nix
  ];
}
