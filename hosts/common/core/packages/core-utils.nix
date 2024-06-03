{ pkgs, config, ...}:
{
  # Core Utilities
  environment.systemPackages = with pkgs; [
    bc
    bemenu
    bluetuith
    brightnessctl
    btop
    calcurse
    fastfetch
    fish
    keepassxc
    syncthing
    libnotify
    ripgrep
    zoxide
  ];
}
