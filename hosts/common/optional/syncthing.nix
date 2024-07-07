{
  ...
}:
{
  services.syncthing = {
    enable = true;
    user = "da";
    dataDir = "/home/da/sync";
    configDir = "/home/da/.config/syncthing/";
    overrideDevices = true;     # overrides any devices added or deleted through the WebUI
    overrideFolders = true;     # overrides any folders added or deleted through the WebUI
    settings = {
      devices = {
        "t470" = { id = "TQC66HR-HLNRBZR-IXUKF2Z-VEREX2P-CHS7CD7-3WE5VHU-G6RSE4P-ZDTQ3QH"; };
        # below to be changed
        "x220" = { id = "G644Q6V-I6SQFNM-GCGVIBV-JNGH367-KEY3V2Y-DZJCYVE-4DP4BGL-PUZM4AU"; };
      };
      folders = {
        "writing" = {
          path = "/home/da/write";
          devices = [
            "t470"
            "x220"
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
