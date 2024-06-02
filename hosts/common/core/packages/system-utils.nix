{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    grub2
    gparted
  ];
}
