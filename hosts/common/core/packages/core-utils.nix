{
  pkgs,
  ...
}:
{
  # Core Utilities
  environment.systemPackages = with pkgs; [
    bc
    bemenu
    bluetuith
    brightnessctl
    btop
    calcurse
    croc
    fastfetch
    fish
    just
    keepassxc
    syncthing
    libnotify
    ripgrep
    zoxide
  ];
}
