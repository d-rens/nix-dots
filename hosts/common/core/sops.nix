{
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = ../../../secrets.yaml;
    defaultSopsFormat = "yaml";

    age = {
      keyFile = "/home/da/.config/sops/age/keys.txt";
    };

    secrets = {
      "msmtp/password" = { };
    };
  };
}
