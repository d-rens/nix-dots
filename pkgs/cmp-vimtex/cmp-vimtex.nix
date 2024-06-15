{ config, pkgs, ... }:

let
  cmp-vimtex = pkgs.vimUtils.buildVimPlugin {
    name = "cmp-vimtex";
    src = pkgs.fetchFromGitHub {
      owner = "micangl";
      repo = "cmp-vimtex";
      rev = "a64b1b5eec0460144c91c4f20a45c74b8ded48ae";
      hash = "sha256-063n6wnf8a5c2ix0zsnjsdakb1sx2bmcxbx02s1hvzhbl0475y72";
    };
  };
in
{
  environment.systemPackages = [
    (
      pkgs.neovim.override {
        configure = {
          packages.myPlugins = with pkgs.vimPlugins; {
          start = [
            cmp-vimtex # custom package
          ];
          opt = [];
        };
        # ...
      };
     }
    )
  ];
}
