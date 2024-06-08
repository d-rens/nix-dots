{ config, pkgs, inputs, ...}:

{
  imports = [
    ../core
    ../optional/gnome.nix
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

  programs = {
    #river.enable = true;
    fish.enable = true;
    gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
    };
  };
}
