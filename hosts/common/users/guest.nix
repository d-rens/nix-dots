{ config, pkgs, inputs, ...}:

{
  imports = [
    ../optional/gnome.nix
  ];


  users = {
    users.guest= {
      isNormalUser = true;
      description = "guest";
      extraGroups = [ 
        "wheel" 
        "networkmanager" 
        "video" 
        "audio" 
        "lp" 
        "scanner" 
      ];
      initialPassword = "guest"; 
    };
  };
}
