{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    cargo
    wget
    lf
    tree
    gdu
    gcc # for treesitter
    grub2
    gparted
    parted
  ];
}
