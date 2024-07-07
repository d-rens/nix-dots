{
  config,
  ...
}:
{
  sops.secrets = {
    "wg/private" = {
      owner = config.users.users.da.name;
      inherit (config.users.users.da) group;
    };
    "wg/shared" = {
      owner = config.users.users.da.name;
      inherit (config.users.users.da) group;
    };
  };

  networking.firewall = {
    allowedUDPPorts = [ 53486 ];
  };

  networking.wireguard.interfaces = {
    home = {
      ips = [
        "192.168.0.205/24"
      ];
      listenPort = 53486;
      privateKeyFile = "${config.sops.secrets."wg/private".path}";
      peers = [
      {
        publicKey = "SblQQHukvOpORXjZyXATv+NN0zpsQ6G0GbDH1mWM4hQ=";
        presharedKeyFile = "${config.sops.secrets."wg/shared".path}";
        allowedIPs = [ 
          "0.0.0.0/0" 
          "192.168.0.0/24"
        ];
        endpoint = "fajs5pi50gemmzmk.myfritz.net:53486";
        persistentKeepalive = 25;
      }
      ];
    };
  };
}
