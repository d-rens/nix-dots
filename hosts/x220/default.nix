{ config, pkgs, inputs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix
      ../common/core
      ../common/optional/music.nix
      ../common/optional/wayland.nix
      ../common/users/da.nix
    ];

  networking = {
    networkmanager.enable = true;
    hostName = "nixos-x"; 
  };
}
