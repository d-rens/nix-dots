{ ... }:
{
  sops = {
    defaultSopsFile = ../../../secrets.yaml;
    defaultSopsFormat = "yaml";

    age = {
      keyFile = "/home/da/.config/sops/age/keys.txt";
      sshKeyPaths = [
        "/etc/ssh/ssh_host_ed25519_key"
      ];
    };

    secrets = {
      "mail/main" = { };
      "mail/secondary" = { };
    };
  };
}
