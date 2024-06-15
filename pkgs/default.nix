{ pkgs }:
{
  rec {
    cmp-vimtex = pkgs.callPackage ./cmp-vimtex/ { };
  };
}
