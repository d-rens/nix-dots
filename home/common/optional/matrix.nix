{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    #cinny-desktop
    #element-desktop
    #fluffychat
    gomuks
    iamb
  ];
}
