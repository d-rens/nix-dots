{ config, pkgs, inputs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix

      ../common/users/desk.nix
    ];

  networking = {
    networkmanager.enable = true;
    hostName = "nixos-t"; 
  };
}
