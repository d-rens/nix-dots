{ config, pkgs, inputs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix

      ../common/core

      ../common/users/da.nix
      ../common/users/desk.nix
    ];

  networking = {
    networkmanager.enable = true;
    hostName = "nixos-t"; 
  };
  services.hardware.bolt.enable = true;
}
