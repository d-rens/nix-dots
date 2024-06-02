{ pkgs, config, lib, ... }:

{
    imports = [
      ./core-utils.nix
      ./fonts.nix
      ./system-utils.nix
    ];
}
