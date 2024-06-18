{ pgks, config, ... }:
{
    imports = [
      ./octave.nix
      ./texlive.nix
      ./calibre.nix
    ];
}
