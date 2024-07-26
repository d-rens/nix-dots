> [!IMPORTANT]  
> Moved to [sourcehut](https://git.sr.ht/~d-rens/nixos-dotfiles).
> The config here will be outdated and worse.
> It will maybe eventually be mirrored, but not currently.







# nix

## structure
Mainly migitated from (emergentMind's nixconfig)[https://github.com/EmergentMind/nix-config/].

## general tasks
- [ ] academics setup
  - [ ] typst snippets for nixvim
  - [ ] hotkeys to do stuff
  - [ ] make it frictionless
- [ ] declarative partitioning
- [ ] maybe justfile for some tasks
- [ ] declare firefox
- [x] secret management
- [x] port neovim to nix-nvim

### no idea how to do the following in a good way: 
- [ ] jabref (weird way to make browser extension work)

### general structure (status of 8th july 2024)
```
├── home
├── hosts
├── flake.nix
├── flake.lock
├── secrets.yaml
├── README.md
└── shell.nix
```

### home-manager
```
home
├── common
│   ├── core
│   │   ├── browsing.nix
│   │   ├── default.nix
│   │   ├── fish.nix
│   │   ├── lf
│   │   │   ├── default.nix
│   │   │   └── icons
│   │   ├── nvim
│   │   │   ├── completion
│   │   │   │   ├── cmp.nix
│   │   │   │   └── lspkind.nix
│   │   │   ├── default.nix
│   │   │   ├── git
│   │   │   │   └── gitsigns.nix
│   │   │   ├── keymaps.nix
│   │   │   ├── lsp
│   │   │   │   ├── lsp.nix
│   │   │   │   └── trouble.nix
│   │   │   ├── options.nix
│   │   │   ├── README.md
│   │   │   ├── telescope
│   │   │   │   └── telescope.nix
│   │   │   ├── ui
│   │   │   │   └── indent-blankline.nix
│   │   │   └── utils
│   │   │       ├── better-escape.nix
│   │   │       ├── colorizer.nix
│   │   │       ├── oil.nix
│   │   │       └── vimtex.nix
│   │   └── sops.nix
│   └── optional
│       ├── academia
│       │   ├── calibre.nix
│       │   ├── default.nix
│       │   ├── octave.nix
│       │   ├── texlive.nix
│       │   └── typst.nix
│       ├── alacritty.nix
│       ├── audio.nix
│       ├── git.nix
│       ├── kitty.nix
│       ├── mail
│       │   ├── accs.nix
│       │   ├── default.nix
│       │   └── mw.nix
│       ├── matrix.nix
│       ├── music.nix
│       ├── newsboat.nix
│       ├── sops.nix
│       ├── tmux.nix
│       ├── video.nix
│       ├── wayland
│       │   ├── default.nix
│       │   ├── river.nix
│       │   ├── swaync.css
│       │   ├── sway.nix
│       │   ├── waybar.css
│       │   ├── waybars-river.nix
│       │   └── waybars-sway.nix
│       ├── xournalpp
│       │   ├── default.nix
│       │   ├── README.md
│       │   └── src
│       │       ├── palette.gpl
│       │       ├── plugins
│       │       │   └── shortcuts
│       │       │       ├── main.lua
│       │       │       └── plugin.ini
│       │       ├── settings.xml
│       │       └── toolbar.ini
│       └── zathura.nix
├── da
│   └── default.nix
├── desk
│   └── default.nix
└── guest
    └── default.nix
```

### hosts
```
hosts
├── common
│   ├── core
│   │   ├── audio.nix
│   │   ├── bootloader.nix
│   │   ├── default.nix
│   │   ├── locals.nix
│   │   ├── network.nix
│   │   ├── nix.nix
│   │   ├── packages
│   │   │   ├── core-utils.nix
│   │   │   ├── default.nix
│   │   │   ├── fonts.nix
│   │   │   └── system-utils.nix
│   │   ├── security.nix
│   │   ├── services.nix
│   │   ├── sops.nix
│   │   ├── stylix
│   │   │   ├── default.nix
│   │   │   └── wallpapers
│   │   │       ├── concept-1.jpg
│   │   │       ├── mountains.jpg
│   │   │       ├── wp-2.jpg
│   │   │       ├── wp-3.jpg
│   │   │       └── wp-4.jpg
│   │   └── user-options.nix
│   ├── optional
│   │   ├── gnome.nix
│   │   ├── keyd.nix
│   │   ├── msmtp.nix
│   │   ├── music.nix
│   │   ├── printing.nix
│   │   ├── river.nix
│   │   ├── sway.nix
│   │   ├── syncthing.nix
│   │   ├── wayland.nix
│   │   ├── wireguard.nix
│   │   └── xorg.nix
│   └── users
│       ├── da.nix
│       ├── desk.nix
│       └── guest.nix
├── t470
│   ├── default.nix
│   └── hardware-configuration.nix
└── x220
    ├── default.nix
    └── hardware-configuration.nix
```
