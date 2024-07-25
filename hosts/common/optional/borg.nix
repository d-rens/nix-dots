{
  ...
}:
{
  #sops.secrets = {
  #  "borg-key" = {
  #    owner = config.users.users.da.name;
  #    inherit (config.users.users.da) group;
  #  };
  #};

  services.borgbackup.jobs.t470 = {
    paths = "/home/da/";

    environment = {
      BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK = "yes";
      BORG_RSH = "ssh -o 'StrictHostKeyChecking=no' -i /home/da/.ssh/id_ed25519";
    };

    exclude = [
      "/home/da/.*"
      "/home/da/Downloads/"
    ];

    encryption = {
      mode = "none";
    };

    repo = "ssh://pi@192.168.0.137:22/mnt/data/borg/t470";
    compression = "zstd,1";
    startAt = "daily";
  };
}
