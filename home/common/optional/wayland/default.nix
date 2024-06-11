{ config, pkgs, lib, ... }:

  let
  footnotify = pkgs.writeShellScriptBin "foot-notify" ''
    ${pkgs.libnotify}/bin/notify-send -a $1 -i utilities-terminal "$2" "$3"
    ${pkgs.curl}/bin/curl -H "Title: $2" -d "$3" "https://ntfy.sh/$(cat ${config.xdg.configHome}/foot/ntfy-token.txt)"
  '';
in
{

  imports = [
    ./waybars.nix
    ./river.nix
  ];

  home.packages = with pkgs; [
    #dex
    #gammastep
    #glfw-wayland
    fuzzel
    grim
    #gnome.eog
    #lxqt.lxqt-openssh-askpass
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

  programs.foot = {
    enable = true;
    package = pkgs.foot;
    settings = {
      main = {
        term = "xterm-256color";
        #font = "DroidSansM Nerd Font Mono:size=10";
        pad = "0x0 center";
        notify = "${footnotify}/bin/foot-notify \${app-id} \${title} \${body}";
        notify-focus-inhibit = "yes";
        bold-text-in-bright = "yes";
        dpi-aware = "no"; # Sway does this for us
      };
      scrollback = {
        lines = 100000;
        multiplier = 5.0;
      };
      mouse = {
        hide-when-typing = "yes";
        alternate-scroll-mode = "yes";
      };
      colors = {
        #alpha = 0.95;
        foreground = "ffffff";
        background = "000000";
        ## Normal/regular colors (color palette 0-7)
        regular0 = "000000"; # black
        regular1 = "aa0000"; # red
        regular2 = "00aa00"; # green
        regular3 = "aa5500"; # yellow
        regular4 = "89ddff"; # blue
        regular5 = "aa00aa"; # magenta
        regular6 = "00aaaa"; # cyan
        regular7 = "aaaaaa"; # white

        ##Bright colors (color palette 8-15)
        bright0 = "555555"; # bright black
        bright1 = "ff5555"; # bright red
        bright2 = "55ff55"; # bright green
        bright3 = "ffff55"; # bright yellow
        bright4 = "5555ff"; # bright blue
        bright5 = "ff55ff"; # bright magenta
        bright6 = "55ffff"; # bright cyan
        bright7 = "ffffff"; # bright white
      };
      key-bindings = {
        prompt-prev = "Control+Shift+z";
        prompt-next = "Control+Shift+x";
        unicode-input = "Control+Shift+u";
      };
    };
  };



  programs.fuzzel = {
    enable = true;
  };

  # switch to sunset instead of gammastep

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

  # makes hotplug display settings
  #services.kanshi = {
  #  enable = true;
  #};
}
