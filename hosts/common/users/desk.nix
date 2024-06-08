{ config, pkgs, home-manager, inputs, ...}:

{
  imports = [
    ../core
    ../optional/gnome.nix
    #../users/desk.nix
  ];


  environment = {
      shells = with pkgs; [ fish ];
      variables.EDITOR = "nvim";
  };


  users = {
    defaultUserShell = pkgs.fish;
    users.desk= {
      isNormalUser = true;
      description = "desk";
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

  programs = {
    #river.enable = true;
    fish.enable = true;
    gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
    };
  };
}
