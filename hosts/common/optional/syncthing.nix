{
  ...
}:
{
  services.syncthing = {
    enable = true;
    user = "da";
    #dataDir = "/home/da/sync"; # default here is /var/lib/syncthing/
    configDir = "/home/da/.config/syncthing/";
    overrideDevices = true;     # overrides any devices added or deleted through the WebUI
    overrideFolders = true;     # overrides any folders added or deleted through the WebUI
    settings = {
      devices = {
        "t470" = { id = "CYUCLYC-VBU3A3M-3J2AN3G-6TGSGAV-WAMY6DN-VHZOZGQ-5YYQGR2-4O5OYQF"; };
        "x220" = { id = "G644Q6V-I6SQFNM-GCGVIBV-JNGH367-KEY3V2Y-DZJCYVE-4DP4BGL-PUZM4AU"; };
        "hua"  = { id = "5YVE4KW-32BMO7V-4Q4KYMT-Q7U4TF7-5SUSSYZ-IMBGYDR-UZI7LLM-PPJJPA7"; };
        "mac"  = { id = "FUE7TEM-KDS7JVG-ALHYAR7-PRMGCNS-H3A5NAE-OFUTQUE-7A7UISG-76U6AQS"; };
      };
      folders = {
        "writing" = {
          path = "/home/da/writing";
          devices = [
            "t470"
            "x220"
            "hua"
          ];
        };
        "books" = {
          path = "/home/da/media/books";
          devices = [
            "t470"
            "x220"
            "hua"
          ];
        };
        "music" = {
          path = "/home/da/media/music";
          devices = [
            "t470"
            "x220"
            "hua"
            "mac"
          ];
        };
        "sec" = {
          path = "/home/da/sec";
          devices = [
            "t470"
            "x220"
            "hua"
            "mac"
          ];
        };
      };
    };
  };
  networking.firewall = {
    allowedTCPPorts = [
      8384 # GUI
      22000 # traffic
    ];
    allowedUDPPorts = [
      22000 # traffic
      21027 # discovery
    ];
  };
}
