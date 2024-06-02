{ config, pkgs, inputs, ...}:

let
  user = "da";
in

{
  imports = [
    # ./placeholder.nix
  ];


  environment = {
      shells = with pkgs; [ fish ];
      variables.EDITOR = "nvim";
  };


  users = {
    defaultUserShell = pkgs.fish;
    users.da= {
      isNormalUser = true;
      description = "da";
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
