# xournalpp seems to not work on wayland
- https://github.com/getsolus/packages/issues/1563
- https://github.com/xournalpp/xournalpp/issues/5198

> will take care of it eventually but as it is not in use rn it's not too urgent, but want to keep it in the config.

## error i get
```fish
~> xournalpp
xopp-Message: 09:46:50.170: TEXTDOMAINDIR = (null), Platform-specific locale dir = /nix/store/iqm3ar29apl8g0vp3h5alha09zs7xwnv-xournalpp-1.2.3/share/xournalpp/../locale, chosen directory = /nix/store/iqm3ar29apl8g0vp3h5alha09zs7xwnv-xournalpp-1.2.3/share/xournalpp/../locale
ALSA lib pcm.c:2792:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.rear
ALSA lib pcm.c:2792:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.center_lfe
ALSA lib pcm.c:2792:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.side
ALSA lib pcm_route.c:878:(find_matching_chmap) Found no matching channel map
ALSA lib pcm_route.c:878:(find_matching_chmap) Found no matching channel map
ALSA lib pcm_route.c:878:(find_matching_chmap) Found no matching channel map
ALSA lib pcm_route.c:878:(find_matching_chmap) Found no matching channel map
xopp-Message: 09:46:50.240: Plugin "MigrateFontSizes" UI initialized

(com.github.xournalpp.xournalpp:35416): xopp-WARNING **: 09:46:50.338: No device found. Is Xournal++ running in debugger / Eclipse...?
Probably this is the reason for not finding devices!


(com.github.xournalpp.xournalpp:35416): xopp-WARNING **: 09:46:50.360: No device found. Is Xournal++ running in debugger / Eclipse...?
Probably this is the reason for not finding devices!

**
Gtk:ERROR:../gtk/gtkiconhelper.c:495:ensure_surface_for_gicon: assertion failed (error == NULL): Icon 'image-missing' not present in theme Adwaita (gtk-icon-theme-error-quark, 0)
Bail out! Gtk:ERROR:../gtk/gtkiconhelper.c:495:ensure_surface_for_gicon: assertion failed (error == NULL): Icon 'image-missing' not present in theme Adwaita (gtk-icon-theme-error-quark, 0)

(com.github.xournalpp.xournalpp:35416): xopp-WARNING **: 09:46:50.383: [Crash Handler] Crashed with signal 6

(com.github.xournalpp.xournalpp:35416): xopp-WARNING **: 09:46:50.383: [Crash Handler] Wrote crash log to: /home/x/.cache/xournalpp/errorlogs/errorlog.20240602-094650.log
/nix/store/kln7kinji3b7sz8r50h4gn9yy6k1js9a-binutils-wrapper-2.41/bin/addr2line: 'xournalpp': No such file

(com.github.xournalpp.xournalpp:35416): xopp-WARNING **: 09:46:50.776: Trying to emergency save the current open document…

(com.github.xournalpp.xournalpp:35416): xopp-WARNING **: 09:46:50.777: Successfully saved document to "/home/x/.config/xournalpp/emergencysave.xopp"
```
