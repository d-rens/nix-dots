{ pkgs, config, ... }:
{
  # firefox could be fully declared, but is still firefox
  home.packages = with pkgs; [
    librewolf
    #firefox
    lynx
  ];
}
