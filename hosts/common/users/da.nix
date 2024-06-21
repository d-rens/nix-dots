{ 
  pkgs, 
  ...
}:
{
  imports = [
    ../optional/music.nix
    ../optional/wayland.nix
    #../optional/river.nix
    ../optional/sway.nix
    ../optional/printing.nix
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
