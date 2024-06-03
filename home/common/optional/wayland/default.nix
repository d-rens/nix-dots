{ pkgs, config, ... }:
{
  imports = [
    ./base.nix
    ./river.nix
    ./waybars.nix
  ];
}
