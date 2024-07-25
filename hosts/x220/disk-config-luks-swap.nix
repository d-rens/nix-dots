{
  config,
  ...
}:
{
  sops.secrets = {
    "luks/x220" = {
      owner = config.users.users.da.name;
      inherit (config.users.users.da) group;
    };
  };

  disko.devices = {
    disk = {
      main = {
        type = "disk";
        #device = "/dev/sda"; # gets passed in configuration.nix
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };

            luks-root = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                settings.allowDiscards = true;
                passwordFile = "/tmp/kuks.txt";
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/";
                };
              };
            };

            luks-swap = {
              size = "20G";
              content = {
                type = "luks";
                name = "swap";
                passwordFile = "/tmp/kuks.txt";
                content = {
                  type = "swap";
                  discardPolicy = "both";
                  resumeDevice = true;
                };
              };
            };
          };
        };
      };
    };
  };
}
