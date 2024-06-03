{ pkgs, config, ...}:
{
  environment.systemPackages = with pkgs; [
    font-manager
    font-awesome
    fontconfig
    freetype
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    cm_unicode
    dina-font
    fira-code
    fira-code-symbols
    iosevka
    liberation_ttf
    maple-mono
    maple-mono-NF
    mplus-outline-fonts.githubRelease
    mononoki
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    proggyfonts
    harfbuzz
  ];
}
