{ config, pkgs, inputs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix

      ../core

      ../common/users/da.nix
      ../common/users/desk.nix
    ];

  networking = {
    networkmanager.enable = true;
    hostName = "nixos-t"; 
  };
}
