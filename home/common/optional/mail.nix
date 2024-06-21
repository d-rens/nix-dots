{ pkgs,  ... }:
{
    home.packages = with pkgs; [
      abook
      mutt-wizard
      msmtp
      neomutt
      isync
      pass
    ];
}
