{ config, pkgs, inputs, ...}:
{

  systemd.services.mpd.environment = {
      XDG_RUNTIME_DIR = "/run/user/1000"; 
  };

  services = {

    mpd = {
        enable = true;
        musicDirectory = "/home/x/media/music";
        network.listenAddress = "any";
        user = "da";
        extraConfig = ''
            audio_output {
                type "pipewire"
                    name "pipewire"
            }
            audio_output {
                type "fifo"
                name "fifo"
                path "/tmp/mpd.fifo"
                format "44100:16:2"
            }
        '';
      };
  };

}
