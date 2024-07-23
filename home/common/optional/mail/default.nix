{ 
  config, 
  pkgs,  
  ... 
}:
let
  main-host = "mail.infomaniak.com";
  name = "Daniel Renschler";
in
{

  sops.secrets = {
    "mail/main" = { };
    "mail/secondary" = { };
  };


  home.packages = with pkgs; [
    abook
    alot
    mutt-wizard
    msmtp
    notmuch
    neomutt
    isync
    pass
  ];

  programs.neomutt = {
    enable = true;
    sort = "reverse-date";

    extraConfig = ''
      source /home/da/.config/neomutt/accounts/main.muttrc

      macro index,pager i1 '<sync-mailbox><enter-command>source /home/da/.config/neomutt/accounts/main.muttrc<enter><change-folder>!<enter>;<check-stats>' "switch to d-rens.xyz account"
      macro index,pager i2 '<sync-mailbox><enter-command>source /home/da/.config/neomutt/accounts/sec.muttrc<enter><change-folder>!<enter>;<check-stats>' "switch to mailbox account"
      '';
  };


  imports = [
    ./mw.nix
    ./accs.nix
  ];

  programs.mbsync = {
    enable = true;
  };
  services.mbsync = {
    enable = true;
    frequency = "*-*-* *:00:00";
  };
  #programs.msmtp.enable = true;


  accounts.email = {
  maildirBasePath = "/home/da/.local/share/mail";
    accounts = {
    personal = {
      primary = true;
      address = "daniel@d-rens.xyz";
      gpg = {
        key = "F0F7 08E2 ED28 1B48";
        signByDefault = true;
      };
      imap = {
        host = main-host;
        port = 993;
      };
      neomutt = {
        enable = true;
      };
      mbsync = {
        enable = true;
        create = "both";
        subFolders = "Verbatim";
        extraConfig = {
          channel = {
            CopyArrivalDate = "yes";
          };
        };
      };
      smtp = {
        host = "mail.infomaniak.com";
        port = 465;
      };
      realName = name;
      userName = "daniel@d-rens.xyz";
      passwordCommand = "cat ${config.sops.secrets."mail/main".path}";
    };


    secondary = {
      address = "d-rens@mailbox.org";
      imap = {
        host = "imap.mailbox.org";
        port = 993;
      };
      neomutt = {
        enable = true;
      };
      mbsync = {
        enable = true;
        subFolders = "Verbatim";
        create = "both";
        extraConfig = {
          channel = {
            CopyArrivalDate = "yes";
          };
        };
      };
      smtp = {
        host = "smtp.mailbox.org";
        port = 465;
      };
      realName = name;
      userName = "d-rens@mailbox.org";
      passwordCommand = "cat ${config.sops.secrets."mail/secondary".path}";
    };
  };
  };
}
