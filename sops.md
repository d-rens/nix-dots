# sops
here are things that I need to encrypt and find out more about.

## what to find out
- can I make more complex age keys.

## list
- iamb
- neomutt, inboxes
- msmpt, smpt info
- wireguard [wiki for wireguard](https://nixos.wiki/wiki/WireGuard)

- ssh & gpg?
Should be able to use this for both of those:
```nix
sops = {
  secrets.gpg-key = {
    mode = "0400";
    path = "${config.home.homeDirectory}/.gnupg/private-keys-v1.d/<id>.key";
  };
};
```
