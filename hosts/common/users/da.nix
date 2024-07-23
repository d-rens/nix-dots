{ 
  pkgs, 
  ...
}:
{
  imports = [
    #../optional/river.nix
    ../optional/keyd.nix
    ../optional/jabref.nix
    ../optional/msmtp.nix
    ../optional/music.nix
    ../optional/printing.nix
    ../optional/sway.nix
    ../optional/syncthing.nix
    ../optional/wayland.nix
    #../optional/wireguard.nix
    #../optional/virtualisation.nix
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
    };
  };
}
