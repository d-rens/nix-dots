{ config, pkgs, inputs, ...}:
{

  environment = {
      shells = with pkgs; [ fish ];
      variables.EDITOR = "nvim";
  };

  programs = {
      fish.enable = true;
      gnupg.agent = {
          enable = true;
          enableSSHSupport = true;
      };
  };

  users.defaultUserShell = pkgs.fish;
}
