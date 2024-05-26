# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

let
  # variables can be defined in here
  user="x";
in

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../default/suckless.nix
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

  environment.systemPackages = with pkgs; [
    arandr
    bc
    binutils
    bluetuith
    brightnessctl
    btop
    ripgrep
    lua
    calcurse
    fastfetch
    firefox
    fish
    fontconfig
    freetype
    kitty
    unclutter
    gcc
    git
    gnumake
    gomuks
    sct
    gparted
    grub2
    harfbuzz
    keepassxc
    keepmenu
    lf
    librewolf
    makeWrapper
    mpc-cli
    mpd
    ncmpcpp
    neovim
    pkg-config
    pulsemixer
    pywal
    slock
    syncthing
    tmux
    tree
    wget
    xorg.libX11
    xorg.libX11.dev
    xorg.libXft
    xorg.libXinerama
    xorg.xkbcomp
    xorg.xmodmap
    yt-dlp
    zoxide
  ];

  fonts.packages = with pkgs; [
    cm_unicode
    dina-font
    fira-code
    fira-code-symbols
    iosevka
    liberation_ttf
    maple-mono
    maple-mono-NF
    mplus-outline-fonts.githubRelease
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    proggyfonts
  ];


  environment.shells = with pkgs; [ fish ];
  programs = {
    fish.enable = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  

  services = {
    displayManager.defaultSession = "none+dwm";
    xserver = {
      displayManager.lightdm.enable = true;
      enable = true;
      windowManager = {
        dwm = {
          enable = true;
        };
      };
      #xkb = {
      #  layout = "us";
      #  options = "
      #  caps:escape
      #  ";
      #};
    };
    openssh.enable = true;
  };

  services.mpd = {
    enable = true;
    musicDirectory = "/mnt/share/music";
    network.listenAddress = "any";
    user = "x";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "pipewire"
      }
    '';
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

  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR =
      "/run/user/1000"; 
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
