{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    cargo
    eza
    gcc # for treesitter
    gdu
    gparted
    grub2
    lf
    parted
    tree
    wget
  ];
}
