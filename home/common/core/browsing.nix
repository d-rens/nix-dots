{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    librewolf
    #firefox # gets managed by home-manager
    lynx
  ];
}
