# this file should not be in hosts

{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    gtk2
    gtk3
    gtk4
    base16-schemes
  ];

  stylix = {
    polarity = "dark";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-cave.yaml";

    opacity = {
        terminal = 0.8;
        desktop = 0.8;
        applications = 0.8;
    };

    targets = {
        grub.enable = false;
    };


    fonts = {
      serif = {
        package = pkgs.cm_unicode;
        name = "CMU Serif";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      monospace = {
        package = pkgs.iosevka;
        name = "Iosevka";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
  stylix.image = wallpapers/concept-1.jpg;
}