{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    jabref
  ];
  programs.firefox.nativeMessagingHosts.jabref = {
    enable = true;
  };
}
