{ pkgs, config, lib, ...}:
{
  services = {
    openssh = {
      enable = true;
    };
  };
  hardware = {
    bluetooth = {
      enable = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };
  };
}
