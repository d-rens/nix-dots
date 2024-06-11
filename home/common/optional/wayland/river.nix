{ config, pkgs, ...}:

{
xdg.configFile = {
    "river/wp.jpg".source = ../../../../hosts/common/core/stylix/wallpapers/concept-1.jpg;
};
wayland.windowManager.river.enable = true;
wayland.windowManager.river.extraConfig = ''
#!/bin/sh

riverctl map normal Super+Shift Return zoom
riverctl map normal Super Return spawn foot


riverctl map normal Super Q close


# exit river
riverctl map normal Super+Shift E exit


riverctl map normal Super J focus-view next
riverctl map normal Super K focus-view previous


riverctl map normal Super+Shift J swap next
riverctl map normal Super+Shift K swap previous


riverctl map normal Super Period focus-output next
riverctl map normal Super Comma focus-output previous


riverctl map normal Super+Shift Period send-to-output next
riverctl map normal Super+Shift Comma send-to-output previous


riverctl map normal Super H send-layout-cmd rivertile "main-ratio -0.05"
riverctl map normal Super L send-layout-cmd rivertile "main-ratio +0.05"


riverctl map normal Super+Shift H send-layout-cmd rivertile "main-count +1"
riverctl map normal Super+Shift L send-layout-cmd rivertile "main-count -1"


# move freely
riverctl map normal Super+Alt H move left 100
riverctl map normal Super+Alt J move down 100
riverctl map normal Super+Alt K move up 100
riverctl map normal Super+Alt L move right 100

riverctl map normal Super+Alt+Control H snap left
riverctl map normal Super+Alt+Control J snap down
riverctl map normal Super+Alt+Control K snap up
riverctl map normal Super+Alt+Control L snap right

# Super+Alt+Shift+{H,J,K,L} to resize views, whenever one would need that
riverctl map normal Super+Alt+Shift H resize horizontal -100
riverctl map normal Super+Alt+Shift J resize vertical 100
riverctl map normal Super+Alt+Shift K resize vertical -100
riverctl map normal Super+Alt+Shift L resize horizontal 100

riverctl map-pointer normal Super BTN_LEFT move-view
riverctl map-pointer normal Super BTN_RIGHT resize-view
riverctl map-pointer normal Super BTN_MIDDLE toggle-float

for i in $(seq 1 9)
do
    tags=$((1 << ($i - 1)))

    # Super+[1-9] to focus tag [0-8]
    riverctl map normal Super $i set-focused-tags $tags

    # Super+Shift+[1-9] to tag focused view with tag [0-8]
    riverctl map normal Super+Shift $i set-view-tags $tags

    # Super+Control+[1-9] to toggle focus of tag [0-8]
    riverctl map normal Super+Control $i toggle-focused-tags $tags

    # Super+Shift+Control+[1-9] to toggle tag [0-8] of focused view
    riverctl map normal Super+Shift+Control $i toggle-view-tags $tags
done


all_tags=$(((1 << 32) - 1))
riverctl map normal Super 0 set-focused-tags $all_tags
riverctl map normal Super+Shift 0 set-view-tags $all_tags


riverctl map normal Super Space toggle-float

riverctl map normal Super F toggle-fullscreen

# Super+{Up,Right,Down,Left} to change layout orientation
riverctl map normal Super Up    send-layout-cmd rivertile "main-location top"
riverctl map normal Super Right send-layout-cmd rivertile "main-location right"
riverctl map normal Super Down  send-layout-cmd rivertile "main-location bottom"
riverctl map normal Super Left  send-layout-cmd rivertile "main-location left"


riverctl declare-mode passthrough


# Super+F11 to enter passthrough mode and back
riverctl map normal Super F11 enter-mode passthrough
riverctl map passthrough Super F11 enter-mode normal


for mode in normal locked
do
    # Eject the optical drive (well if you still have one that is)
    riverctl map $mode None XF86AudioRaiseVolume  spawn 'pamixer -i 5'
    riverctl map $mode None XF86AudioLowerVolume  spawn 'pamixer -d 5'
    riverctl map $mode None XF86AudioMute         spawn 'pamixer --toggle-mute'

    riverctl map $mode None XF86AudioMedia spawn 'playerctl play-pause'
    riverctl map $mode None XF86AudioPlay  spawn 'playerctl play-pause'
    riverctl map $mode None XF86AudioPrev  spawn 'playerctl previous'
    riverctl map $mode None XF86AudioNext  spawn 'playerctl next'

    riverctl map $mode None XF86MonBrightnessUp   spawn 'brightnessctl set +5%'
    riverctl map $mode None XF86MonBrightnessDown spawn 'brightnessctl set 5%-'
done

riverctl background-color 0x002b36
riverctl border-color-focused 0x93a1a1
riverctl border-color-unfocused 0x586e75

riverctl set-repeat 50 300


# Make all views with an app-id that starts with "float" and title "foo" start floating.
riverctl rule-add -app-id 'float*' -title 'foo' float


# Make all views with app-id "bar" and any title use client-side decorations
riverctl rule-add -app-id "bar" csd


# Set the default layout generator to be rivertile and start it.
# River will send the process group of the init executable SIGTERM on exit.
riverctl default-layout rivertile
rivertile -view-padding 6 -outer-padding 6 &


riverctl map normal Super P spawn fuzzel


riverctl map normal Super Period focus-output next
riverctl map normal Super Comma focus-output previous

riverctl map normal Super+Shift Period send-to-output next
riverctl map normal Super+Shift Comma send-to-output previous


# Set app-ids and titles of views which should use client side decorations
    riverctl csd-filter-add app-id "gedit"
    
    ## autostart with river
    riverctl spawn "swaybg -i ~/.config/river/wp.jpg"
    riverctl spawn "waybar"
    riverctl spawn "swaync"
    #riverctl spawn "wlr-randr --output DP-2 --mode 2560x1080@144.001007Hz"
    #riverctl spawn "notify-send -t 8000 -i $HOME/.mako-art/nana.png 'Welcome yeti!' &> /dev/null &"
    
    # Set and exec into the default layout generator, rivertile.
    # River will send the process group of the init executable SIGTERM on exit.
    riverctl default-layout rivertile
    exec rivertile -view-padding 4 -outer-padding 4
  '';
}
