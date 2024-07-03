{
  config,
  ...
}:
{
  # this config is at /etc/msmtprc because system level

  sops.secrets = {
    "mail/main" = {
      owner = config.users.users.da.name;
      inherit (config.users.users.da) group;
    };
    "mail/secondary" = {
      owner = config.users.users.da.name;
      inherit (config.users.users.da) group;
    };
  };

  programs.msmtp = {
    enable = true;

    accounts = {
      "daniel@d-rens.xyz" = {
        host = "heracles.mxrouting.net";
        port = "465";
        from = "daniel@d-rens.xyz";
        user = "daniel@d-rens.xyz";
        passwordeval = "cat ${config.sops.secrets."mail/main".path}";
        auth = "on";
        tls = "on";
        tls_trust_file = "/etc/ssl/certs/ca-certificates.crt";
        logfile = "/home/da/.config/msmtp/msmtp.log";
        tls_starttls = "off";
      };

      "d-rens@mailbox.org" = {
        host = "smtp.mailbox.org";
        port = "587";
        from = "d-rens@mailbox.org";
        user = "d-rens@mailbox.org";
        passwordeval = "cat ${config.sops.secrets."mail/secondary".path}";
        auth = "on";
        tls = "on";
        tls_trust_file =	"/etc/ssl/certs/ca-certificates.crt";
        logfile = "/home/da/.config/msmtp/msmtp.log";
      };
    };
  };
}
