{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    octaveFull
  ];
}
