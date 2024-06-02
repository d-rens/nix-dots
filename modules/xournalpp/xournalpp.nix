{ config, pkgs, ...}:

{
    xdg.configFile = {
        "xournalpp/palette.gpl".source = ./src/palette.gpl;
        "xournalpp/settings.xml".source = ./src/settings.xml;
        "xournalpp/toolbar.ini".source = ./src/toolbar.ini;
        "xournalpp/plugins/shortcuts/main.lua".source = ./src/plugins/shortcuts/main.lua;
        "xournalpp/plugins/shortcuts/plugin.ini".source = ./src/plugins/shortcuts/plugin.ini;
    };
}
