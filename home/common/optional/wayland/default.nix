{ 
  config, 
  pkgs, 
  ... 
}:

  let
  footnotify = pkgs.writeShellScriptBin "foot-notify" ''
    ${pkgs.libnotify}/bin/notify-send -a $1 -i utilities-terminal "$2" "$3"
    ${pkgs.curl}/bin/curl -H "Title: $2" -d "$3" "https://ntfy.sh/$(cat ${config.xdg.configHome}/foot/ntfy-token.txt)"
  '';
in
{

  imports = [
    #./river.nix
    ./sway.nix
  ];

  home.packages = with pkgs; [
    fuzzel
    grim
    slurp
    wayland
    wdisplays
    wf-recorder
    wl-clipboard
    wl-mirror 
    wlsunset
  ];

  services.wlsunset = {
    enable = true;
    latitude = 46.8;
    longitude = 8.6;
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
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
      key-bindings = {
        prompt-prev = "Control+Shift+z";
        prompt-next = "Control+Shift+x";
        unicode-input = "Control+Shift+u";
      };
    };
  };



  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
       terminal = "${pkgs.foot}/bin/foot"; 
      };
      border.radius = 1;
      border.width = 0;
    };
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

  services.kanshi = {
    enable = true;
    settings = [
      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            position = "0,0";
            status = "enable";
          }
        ];
      }
      {
        profile.name = "docked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            position = "0,0";
            status = "disable";
          }
          {
            criteria = "DP-6";
            position = "0,0";
            scale = 1.0;
            status = "enable";
          }
          {
            criteria = "DP-4";
            position = "1280,0";
            mode = "2560x1440";
            scale = 1.0;
            status = "enable";
          }
        ];
      }
    ];
  };
}
