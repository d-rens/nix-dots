{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    lf
    tree
    gdu
    gcc # for treesitter
    grub2
    gparted
  ];
}
