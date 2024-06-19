{ 
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    age
    age-plugin-yubikey
    ssh-too-age
  ];
}
