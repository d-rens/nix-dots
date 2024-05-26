# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs }:

{
  environment.systemPackages = with pkgs; [
    ## cli apps
    bc
    bluetuith
    brightnessctl
    btop
    calcurse
    fastfetch
    gomuks
    lf
    mpc-cli
    mpd
    ncmpcpp
    neovim
    pulsemixer
    pywal
    tmux
    tree
    wget
    yt-dlp
    zoxide

    ## X things
    arandr
    harfbuzz
    sct
    slock
    xorg.libX11
    xorg.libX11.dev
    xorg.libXft
    xorg.libXinerama
    xorg.xkbcomp
    xorg.xmodmap

    ## system things
    binutils
    fish
    fontconfig
    freetype
    gcc
    git
    gnumake
    gparted
    grub2
    kitty
    lua
    makeWrapper
    pkg-config
    ripgrep
    unclutter

    ## gui apps
    firefox
    librewolf
    thunderbird

    ## privacy / security
    keepassxc
    keepmenu
    syncthing
  ];
}
