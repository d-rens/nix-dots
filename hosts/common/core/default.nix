{ config, pkgs, inputs, ...}:
{
  imports = [
    ./audio.nix
    ./bootloader.nix
    ./locals.nix
    ./nix.nix
    ./services.nix
    ./stylix.nix
    ./network.nix
    ./user-options.nix
    ./packages
  ];
}
