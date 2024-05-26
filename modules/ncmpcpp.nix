{ config, pkgs, ...}:

{
  home.file = {
    ".config/ncmpcpp/bindings".source = ../configs/ncmpcpp/bindings;
  };
}
