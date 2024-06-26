# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ 
  config, 
  lib, 
  modulesPath, 
  ... 
}:

{
  imports = [ 
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [ 
        "thunderbolt" 
        "xhci_pci" 
        "nvme" 
        "usb_storage" 
        "sd_mod" 
      ];
      kernelModules = [ ];
      luks.devices = {
      "luks-20174d9a-4979-431f-9347-226f2fef0259".device = "/dev/disk/by-uuid/20174d9a-4979-431f-9347-226f2fef0259";
      "nvme0n1p3_crypt".device = "/dev/disk/by-uuid/835970e5-0a52-4538-9d23-1c6ef3de3550";
      };
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" = { 
      device = "/dev/disk/by-uuid/1d7711f8-232e-4081-9a21-4e725ae61065";
      fsType = "ext4";
    };
    "/boot" = { 
      device = "/dev/disk/by-uuid/4EAE-4FEC";
      fsType = "vfat";
      options = [ 
        "fmask=0022" 
        "dmask=0022" 
      ];
    };
  };

  swapDevices = [ 
    { device = "/dev/disk/by-uuid/b03a5d67-c537-4bdc-8e52-6b11b6bc325c"; }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f0u1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
