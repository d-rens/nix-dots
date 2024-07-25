{ 
  ... 
}:

{
  imports = [ 
      ./hardware-configuration.nix
      #./disk-configuration.nix
      ./disk-config-luks-swap.nix

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
