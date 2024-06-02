{ pkgs, config, ...}:
{
  # Core Utilities
  environment.systemPackages = with pkgs; [
    bc
    fastfetch
    fish
    ripgrep
    zoxide
  ];
}
