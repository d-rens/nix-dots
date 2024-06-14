{
  configs,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };
}
