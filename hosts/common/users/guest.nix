{ config, pkgs, inputs, ...}:

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

  programs = {
    #river.enable = true;
    fish.enable = true;
    gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
    };
  };
}
