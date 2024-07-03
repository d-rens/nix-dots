{ pkgs, ... }:
{
    home.packages = with pkgs; [
      typst
      typstyle
      typstfmt
      typst-lsp
      typst-live
    ];
}
