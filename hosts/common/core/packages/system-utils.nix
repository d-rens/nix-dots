{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    cargo
    eza
    gcc # for treesitter
    gdu
    #gparted aint working on sway
    grub2
    lf
    parted
    tree
    wget
  ];
}
