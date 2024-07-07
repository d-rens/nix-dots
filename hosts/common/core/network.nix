{ 
  config,
  ... 
}:
################################ HAVE NOT CONFIRMED IF IT WORKS ###############################
################################ HAVE NOT CONFIRMED IF IT WORKS ###############################
################################ HAVE NOT CONFIRMED IF IT WORKS ###############################
################################ HAVE NOT CONFIRMED IF IT WORKS ###############################
{
  sops.secrets = {
    "wifi/psk" = {
      owner = config.users.users.da.name;
      inherit (config.users.users.da) group;
    };
  };
  networking = {
    networkmanager = {
      enable = true;
      ensureProfiles.profiles = {
        home-wifi = {
          connection = {
            id = "home";
            permissions = "";
            type = "wifi";
          };
          ipv4 = {
            method = "auto";
          };
          ipv6 = {
            addr-gen-mode = "stable-privacy";
            method = "auto";
          };
          wifi = {
            ssid = "DuKommstHierNetRein";
          };
          wifi-security = {
            auth-alg = "open";
            key-mgmt = "wpa-psk";
            psk = "${config.sops.secrets."wifi/psk".path}";
          };
        };
      };
    };
  };
}
