{ config, pkgs, lib, ... }:

{

  imports = [
    ./waybars.nix
    ./river.nix
  ];

  home.packages = with pkgs; [
    dex
    gammastep
    glfw-wayland
    fuzzel
    grim
    gnome.eog
    lxqt.lxqt-openssh-askpass
    slurp
    wayland
    wdisplays
    wl-clipboard
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    XDG_CURRENT_DESKTOP = "river";
    NIXOS_OZONE_WL = "1";
    SDL_VIDEODRIVER = "wayland";
  };

  programs.fuzzel = {
    enable = true;
    #settings = {
    #  main = {
    #    font = config.gtk.font.name;
    #    dpi-aware = "no"; # Sway does this for us
    #    icon-theme = config.gtk.iconTheme.name;
    #    terminal = "${config.programs.foot.package}/bin/foot";
    #    width = 50;
    #  };
    #};
  };

  services.gammastep = {
    enable = true; # fine if systemd'd
    provider = "geoclue2";
    temperature = {
      day = 5500;
      night = 3000;
    };
    settings = {
      general = {
        fade = 1;
      };
    };
  };

  services.swaync = {
    enable = true;
    style = ./swaync.css;
    settings = {
      positionX = "right";
      positionY = "top";
      control-center-positionX = "left";
      notification-2fa-action = false;
      control-center-width = 500;
      layer = "overlay";
      control-center-layer = "overlay";
      widgets = [
        "title"
        "dnd"
        "mpris"
        "notifications"
      ];
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      notification-window-width = 500;
      keyboard-shortcuts = true;
      image-visibility = "always";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
    };
  };

  #services.kanshi = {
  #  enable = true;
  #};
}
