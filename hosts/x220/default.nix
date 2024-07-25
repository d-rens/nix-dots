{ 
  ... 
}:

{
  imports = [ 
      ./hardware-configuration.nix
      ./disk-configuration.nix

      ../common/core

      ../common/users/da.nix
      ../common/users/root.nix
  ];

 disko.devices.disk.main.device = "/dev/sda";

  networking = {
    networkmanager.enable = true;
    hostName = "nixos-x"; 
  };
}
