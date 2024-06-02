#{ config, pkgs, inputs, ...}:
#
#let
#  user = "guest";
#in
#
#{
#  imports = [
#    # ./placeholder.nix
#    # should use gnome
#  ];
#
#
#  # does it need a shell?
#  environment = {
#      shells = with pkgs; [ fish ];
#      variables.EDITOR = "nvim";
#  };
#
#
#  users = {
#    defaultUserShell = pkgs.fish;
#    users.guest= {
#      isNormalUser = true;
#      description = "guest";
#      extraGroups = [ 
#        "wheel" 
#        "networkmanager" 
#        "video" 
#        "audio" 
#        "lp" 
#        "scanner" 
#      ];
#      initialPassword = "guest"; 
#    };
#  };
#
#  programs = {
#    #river.enable = true;
#    fish.enable = true;
#    gnupg.agent = {
#        enable = true;
#        enableSSHSupport = true;
#    };
#  };
#}
#
