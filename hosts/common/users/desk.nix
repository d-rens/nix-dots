{ config, pkgs, home-manager, inputs, ...}:

{
  imports = [
    ../optional/gnome.nix
  ];

  users = {
    users.desk= {
      isNormalUser = true;
      description = "desk";
      uid = 1001;
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

  hardware.pulseaudio.enable = false;

}
