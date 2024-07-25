{ 
  pkgs, 
  ...
}:
{
  imports = [
    #../optional/river.nix
    #../optional/virtualisation.nix
    #../optional/wireguard.nix

    ../optional/borg.nix
    ../optional/jabref.nix
    ../optional/keyd.nix
    ../optional/msmtp.nix
    ../optional/music.nix
    ../optional/printing.nix
    ../optional/sway.nix
    ../optional/syncthing.nix
    ../optional/wayland.nix
  ];

  users = {
    defaultUserShell = pkgs.fish;
    users.da= {
      isNormalUser = true;
      description = "da";
      uid = 1000;
      extraGroups = [ 
        "wheel" 
        "networkmanager" 
        "video" 
        "audio" 
        "lp" 
        "scanner" 
      ];
      initialPassword = "password"; 
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOS9NK7X0K5mgoSTlAB+v8QlIDynJDJCPo6QO3IamnFu da@nixos-t"
      ];
    };
  };
}
