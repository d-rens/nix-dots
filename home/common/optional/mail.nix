{ pkgs, config, ... }:
{
    home.packages = with pkgs; [
      mutt-wizard
      neomutt
      isync
      pass
    ];
}
