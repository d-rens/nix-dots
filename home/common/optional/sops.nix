{ 
  inputs,
  ... }:
{

  #imports = [
  #  inputs.sops-nix.homeManagerModules.sops
  #];

  sops = {
    defaultSopsFile = ../../../secrets.yaml;
    defaultSopsFormat = "yaml";

    age = {
      keyFile = "/home/da/.config/sops/age/keys.txt";
    };

    secrets = {
      "mail/main" = { };
      "mail/secondary" = { };
    };
  };
}
