{ config, pkgs, inputs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix

      ../common/core

      ../common/users/da.nix
    ];

  networking = {
    networkmanager.enable = true;
    hostName = "nixos-x"; 
  };
}
