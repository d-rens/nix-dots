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
    hugo
    foot
    iamb
    isync
    gomuks
    lazygit
    lf
    lynx
    mpc-cli
    mpd
    mpv
    mutt-wizard
    neomutt
    ncmpcpp
    neovim
    pass
    pulsemixer
    pywal
    tmux
    tree
    wget
    xclip
    yt-dlp
    ytfzf
    zoxide

    ## wayland things
    river
    #greetd.greetd  # not working, stopped

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
    librewolf

    ## privacy / security
    keepassxc
    keepmenu
    syncthing
  ];
}
