{
  ... 
}:{
  sops = {
    defaultSopsFile = ../../../secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = /home/da/.config/sops/age/keys.txt;

    secrets = {
      "mail/main" = { };
      "mail/secondary" = { };
    };
  };
}
