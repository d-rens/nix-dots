{ config, pkgs, inputs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix

      ../common/users/da.nix
      ../common/users/guest.nix
    ];

  networking = {
    networkmanager.enable = true;
    hostName = "nixos-x"; 
  };
}
