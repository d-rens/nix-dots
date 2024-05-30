# this file should not be in hosts

{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    ## cli apps
    bc
    bemenu
    bluetuith
    brightnessctl
    btop
    calcurse
    fastfetch
    foot
    iamb
    isync
    lazygit
    libnotify
    lf
    lynx
    mpc-cli
    mpd
    mpv
    mutt-wizard
    ncmpcpp
    neomutt
    neovim
    pass
    playerctl
    pulsemixer
    pywal
    rofi-wayland
    tmux
    tree
    waylock
    wget
    xclip
    yt-dlp
    ytfzf
    zoxide

    # wayland things
    river
    swaybg
    wlr-randr
    mako
    ## waybar
    swaynotificationcenter
    waybar
    font-awesome
    ## screenshot
    grim
    slurp
    swayimg


    # X things
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
    librewolf

    ## privacy / security
    keepassxc
    keepmenu
    syncthing
  ];
}
