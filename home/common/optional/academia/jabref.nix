{
  pkgs,
  ...
}:
{
  # there needs to be the messanging host set in hosts for jabref so it mekes more sense to there also install the jabref package itself
  home.packages = with pkgs; [
    #jabref
  ];
}
