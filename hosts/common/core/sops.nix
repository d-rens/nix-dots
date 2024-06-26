{ ... }:
{

  sops = {
    defaultSopsFile = ../../../secrets.yaml;
    defaultSopsFormat = "yaml";

    age = {
      keyFile = "/home/da/.config/sops/age/keys.txt";
    };

    secrets = {
      "xyz" = { };
      "mb" = { };
      "msmtp/main/host" = { };
      "msmtp/main/password" = { };

      "msmtp/secondary/host" = { };
      "msmtp/secondary/password" = { };
    };
  };
}
