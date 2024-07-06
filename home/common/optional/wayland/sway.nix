{ 
  config, 
  pkgs, 
  lib,
  ...
}:
let
  swayexitify_msg = "System (l) lock, (e) logout, (s) suspend, (h) hibernate, (r) reboot, (Shift+s) shutdown";
  sway_screenshot = "exec ${pkgs.bash}/bin/bash -c '${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" - | wl-copy -t image/png'";
  swayexitify = pkgs.writeShellScriptBin "swayexitify" ''
    lock() {
      ${pkgs.swaylock}/bin/swaylock
    }

    case "$1" in
        lock)
            lock &
            ;;
        logout)
            ${pkgs.sway}/bin/swaymsg exit
            ;;
        suspend)
            ${pkgs.systemd}/bin/systemctl suspend
            ;;
        hibernate)
            ${pkgs.systemd}/bin/systemctl hibernate
            ;;
        reboot)
            ${pkgs.systemd}/bin/systemctl reboot
            ;;
        shutdown)
            ${pkgs.systemd}/bin/systemctl poweroff
            ;;
        *)
            echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
            exit 2
    esac

    exit 0
  '';
in
{
  imports = [
    ./waybars-sway.nix
  ];

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "sway";
  };

  wayland.windowManager.sway = {
    enable = true;
    # Set to null to not add any Sway package to your path.
    # This should be done if you want to use the NixOS Sway module to install Sway.
    package = null;
    config = rec {
      modifier = "Mod4";
      terminal = "${config.programs.foot.package}/bin/foot";
      startup = [
        { command = "${pkgs.blueman}/bin/blueman-applet"; }
        {
          command = "${pkgs.copyq}/bin/copyq";
          always = true;
        }
        {
          command = "${pkgs.systemd}/bin/systemctl --user restart polkit-gnome-authentication-agent-1.service";
          always = true;
        }
      ];
      bars = [ { command = "${pkgs.waybar}/bin/waybar"; } ];
      floating = {
        modifier = modifier;
        border = 1;
        titlebar = false;
      };
      gaps = {
        inner = 10;
        outer = 0;
        smartGaps = true;
      };
      window = {
        border = 1;
        hideEdgeBorders = "both";
        titlebar = false;
        commands = [
          {
            command = "floating enable";
            criteria = {
              window_role = "dialog";
            };
          }
          {
            command = "floating enable";
            criteria = {
              app_id = "thunderbird";
              title = ".*Reminder.*";
            };
          }
        ];
      };
      workspaceAutoBackAndForth = false;
      menu = "${pkgs.fuzzel}/bin/fuzzel";
      left = "h";
      right = "l";
      up = "k";
      down = "j";
      defaultWorkspace = "workspace number 1";
      keybindings =
        with config.wayland.windowManager.sway.config;
        lib.mkOptionDefault {
          "${modifier}+h" = "focus left";
          "${modifier}+l" = "focus right";
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";

          # Window Switcher
          "${modifier}+Tab" = "exec ${pkgs.swayr}/bin/swayr switch-window";

          # Split
          "${modifier}+semicolon" = "splith";

          "${modifier}+0" = "workspace 10";
          "${modifier}+Shift+0" = "move container to workspace 10";
          #"${modifier}+$modalt+1" = "workspace 11";
          #"${modifier}+$modalt+2" = "workspace 12";
          #"${modifier}+$modalt+3" = "workspace 13";
          #"${modifier}+$modalt+4" = "workspace 14";
          #"${modifier}+$modalt+5" = "workspace 15";
          #"${modifier}+$modalt+6" = "workspace 16";
          #"${modifier}+$modalt+7" = "workspace 17";
          #"${modifier}+$modalt+8" = "workspace 18";
          #"${modifier}+$modalt+9" = "workspace 19";
          #"${modifier}+$modalt+0" = "workspace 20";
          #"${modifier}+$modalt+Shift+1" = "move container to workspace 11";
          #"${modifier}+$modalt+Shift+2" = "move container to workspace 12";
          #"${modifier}+$modalt+Shift+3" = "move container to workspace 13";
          #"${modifier}+$modalt+Shift+4" = "move container to workspace 14";
          #"${modifier}+$modalt+Shift+5" = "move container to workspace 15";
          #"${modifier}+$modalt+Shift+6" = "move container to workspace 16";
          #"${modifier}+$modalt+Shift+7" = "move container to workspace 17";
          #"${modifier}+$modalt+Shift+8" = "move container to workspace 18";
          #"${modifier}+$modalt+Shift+9" = "move container to workspace 19";
          #"${modifier}+$modalt+Shift+0" = "move container to workspace 20";

          # Notifications
          "${modifier}+Shift+g" = "exec ${pkgs.swaynotificationcenter}/bin/swaync-client -t";
          "${modifier}+g" = "exec ${pkgs.swaynotificationcenter}/bin/swaync-client -d";

          # Media Player Controls
          "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
          "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
          "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";

          # Volume
          "XF86AudioRaiseVolume" = "exec --no-startup-id ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume" = "exec --no-startup-id ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          "Shift+XF86AudioRaiseVolume" = "exec --no-startup-id ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+";
          "Shift+XF86AudioLowerVolume" = "exec --no-startup-id ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-";
          "XF86AudioMute" = "exec --no-startup-id ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "XF86AudioMicMute" = "exec --no-startup-id ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

          # Brightness
          "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%+ # increase screen brightness";
          "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%- # decrease screen brightness";
          "Shift+XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 1%+ # increase screen brightness";
          "Shift+XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 1%- # decrease screen brightness";

          # Screenshot
          "Print" = sway_screenshot;
          "XF86Launch2" = sway_screenshot;

          # Clipboard history popup
          "Control+$modalt+h" = "exec --no-startup-id ${pkgs.copyq}/bin/copyq menu";

          # Restart Sway inplace
          "${modifier}+Shift+r" = "restart";

          # Logout
          "${modifier}+m" = "exec ${swayexitify}/bin/swayexitify lock";
          "${modifier}+backspace" = ''mode "${swayexitify_msg}"'';
        };
      modes = lib.mkOptionDefault {
        "${swayexitify_msg}" = {
          l = ''exec ${swayexitify}/bin/swayexitify lock, mode "default"'';
          e = ''exec ${swayexitify}/bin/swayexitify logout, mode "default"'';
          s = ''exec ${swayexitify}/bin/swayexitify suspend, mode "default"'';
          h = ''exec ${swayexitify}/bin/swayexitify hibernate, mode "default"'';
          r = ''exec ${swayexitify}/bin/swayexitify reboot, mode "default"'';
          "Shift+s" = ''exec ${swayexitify}/bin/swayexitify shutdown, mode "default"'';
          Return = ''mode "default"'';
          Escape = ''mode "default"'';
        };
        "resize" = {
          "${modifier}+r" = ''mode "default"'';
        };
      };
    };
    extraConfigEarly = ''
      set $modalt Mod4
    '';
    extraConfig = ''
      bindgesture swipe:right workspace next_on_output
      bindgesture swipe:left workspace prev_on_output

      exec_always ${pkgs.kanshi}/bin/kanshictl reload
    '';
    wrapperFeatures = {
      gtk = true;
    };
  };

  services.swayidle = {
    enable = true; # this seems fine if it's managed by systemd...
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
    ];
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        timeout = 305;
        command = ''${pkgs.sway}/bin/swaymsg "output * power off"'';
        resumeCommand = ''${pkgs.sway}/bin/swaymsg "output * power on"'';
      }
    ];
  };

  programs.swaylock = {
    enable = true;
    settings = {
      #color = "000000";
    };
  };

  programs.swayr = {
    enable = true;
    systemd = {
      enable = true;
      target = "sway-session.target";
    };
    settings = {
      menu = {
        executable = "${pkgs.fuzzel}/bin/fuzzel";
        args = [ "--dmenu" ];
      };
      layout = {
        auto_tile = false;
      };
      focus = {
        lockin_delay = 750;
      };
      misc = {
        seq_inhibit = false;
      };
    };

    # [format] is here instead because I need the backslashes
    extraConfig = ''
      [format]
      workspace_format = ""
      container_format = ""
      indent = "    "
      urgency_start = "‼️"
      urgency_end = "‼️"
      html_escape = false
      window_format = "{urgency_start}{title}{urgency_end} \u0000icon\u001f{app_name}"
    '';
  };
}
