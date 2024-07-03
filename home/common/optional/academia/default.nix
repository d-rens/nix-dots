{ pgks, config, ... }:
{
    imports = [
      ./octave.nix
      ./texlive.nix
      ./typst.nix
      ./calibre.nix
    ];
}
