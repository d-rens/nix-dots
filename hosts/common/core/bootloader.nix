{ config, pkgs, inputs, ... }:
{
  boot.loader = {
    #efi = {
    #  canTouchEfiVariables = true;
    #};
    grub = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
      device = "nodev"; # optional?
    };
    timeout = 2;
  };
}
