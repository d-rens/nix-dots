{ config, pkgs, lib, ...}:

{
  programs.zathura = {
    enable = true;
    mappings = lib.mkForce {
      "<C-d>" = "set 'first-page-column 1:3'";
      u = "scroll half-up";
      d = "scroll half-down";
      D = "toggle_page_mode";
      r = "reload";
      R = "rotate";
      K = "zoom in";
      J = "zoom out";
      i = "recolor";
      p = "print";
    };
    options = {
        recolor = "true";
        selection-clipboard = "clipboard";
        statusbar-basename = "true";
        statusbar-home-tilde = "true";
        synctex = "true";
        synctex-editor-command = "vim";
        window-title-basename = "true";
        window-title-home-tilde = "true";
        statusbar-h-padding = 5;
        statusbar-v-padding = 5;
    };
  };
}
