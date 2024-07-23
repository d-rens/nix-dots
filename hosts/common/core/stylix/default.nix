{ 
  pkgs, 
  ... 
}:
{
  environment.systemPackages = with pkgs; [
    gtk2
    gtk3
    gtk4
    base16-schemes
  ];

  stylix = {
    enable = true;
   
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/darkviolet.yaml";

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
        package = pkgs.nerdfonts;
        name = "LiterationSerif Nerd Font Propo";
      };
      sansSerif = {
        package = pkgs.nerdfonts;
        name = "NotoSans Nerd Font Propo";
      };
      monospace = {
        package = pkgs.nerdfonts;
        name = "IosevkaTermSlab Nerd Font Mono";
      };
      emoji = {
        package = pkgs.nerdfonts;
        name = "Symbols Nerd Font";
      };
    };
  };
  #stylix.image = wallpapers/concept-1.jpg;
  stylix.image = wallpapers/wp-1.jpg;
}
