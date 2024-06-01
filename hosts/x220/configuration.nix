# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

let
  user="x";
in

{
  imports = [ 
      ./hardware-configuration.nix
      ../common/suckless.nix
      ../common/packages.nix
      ../common/theme/stylix.nix
    ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };

  networking = {
    hostName = "nixos"; 
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Berlin";


  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
    };
  };



  users = {
    users.x= {
      isNormalUser = true;
      description = "x";
      extraGroups = [ "networkmanager" "wheel" "video" "audio" "lp" "scanner" ];
      initialPassword = "password"; 
      packages = with pkgs; [];
    };
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    cm_unicode
    dina-font
    fira-code
    fira-code-symbols
    iosevka
    liberation_ttf
    maple-mono
    maple-mono-NF
    mplus-outline-fonts.githubRelease
    mononoki
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    proggyfonts
  ];


  environment = {
      shells = with pkgs; [ fish ];
      variables.EDITOR = "nvim";
  };
  programs = {
    river.enable = true;
    fish.enable = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  

  services = {
    openssh.enable = true;
    mpd = {
        enable = true;
        musicDirectory = "/home/x/media/music";
        network.listenAddress = "any";
        user = "x";
        extraConfig = ''
            audio_output {
                type "pipewire"
                    name "pipewire"
            }
        audio_output {
            type "fifo"
                name "fifo"
                path "/tmp/mpd.fifo"
                format "44100:16:2"
        }
        '';
    };
  };

  # because mpd is on system level and pipewire on user level
  systemd.services.mpd.environment = {
      XDG_RUNTIME_DIR = "/run/user/1000"; 
  };


  services = {
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
        pulse.enable = true;
        jack.enable = true;
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


  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "24.05";
  system.autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  users.defaultUserShell = pkgs.fish;
}
