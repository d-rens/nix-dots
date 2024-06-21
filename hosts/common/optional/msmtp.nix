{
  config,
  ...
}:
{
  # this config is at /etc/msmtprc because system level

  sops.secrets = {
    "msmtp/main/host" = {
      owner = config.users.users.da.name;
      inherit (config.users.users.da) group;
    };
    "msmtp/main/password" = {
      owner = config.users.users.da.name;
      inherit (config.users.users.da) group;
    };
    "msmtp/secondary/host" = {
      owner = config.users.users.da.name;
      inherit (config.users.users.da) group;
    };
    "msmtp/secondary/password" = {
      owner = config.users.users.da.name;
      inherit (config.users.users.da) group;
    };
  };

  programs.msmtp = {
    enable = true;

    accounts = {
      "daniel@d-rens.xyz" = {
        eval= "cat ${config.sops.secrets."msmtp/main/host".path}";
        port = "465";
        from = "daniel@d-rens.xyz";
        user = "daniel@d-rens.xyz";
        passwordeval = "cat ${config.sops.secrets."msmtp/main/password".path}";
        auth = "on";
        tls = "on";
        tls_trust_file = "/etc/ssl/certs/ca-certificates.crt";
        logfile = "/home/da/.config/msmtp/msmtp.log";
        tls_starttls = "off";
      };

      "d-rens@mailbox.org" = {
        eval= "cat ${config.sops.secrets."msmtp/secondary/host".path}";
        port = "587";
        from = "d-rens@mailbox.org";
        user = "d-rens@mailbox.org";
        passwordeval = "cat ${config.sops.secrets."msmtp/secondary/password".path}";
        auth = "on";
        tls = "on";
        tls_trust_file =	"/etc/ssl/certs/ca-certificates.crt";
        logfile = "/home/da/.config/msmtp/msmtp.log";
      };
    };
  };
}
