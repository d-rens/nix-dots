{
  inputs,
  ...
}:
{
  imports = [
    ./bookmarks.nix
    ./search-engines.nix
  ];

  programs.firefox = {
    enable = true;

    # breaks home manager :(
    #policies = {
    # DisableFirefoxStudies = true;
    # DisablePocket = true;
    # DisableTelemetry = true;
    # EnableTrackingProtection = true;
    # NewTapPage = false;
    # OfferToSaveLogins = false;
    # TranslateEnabled = false;
    #};

    profiles.default = {
      settings = {
        "browser.activity-stream.showSponsored" = false;
        "browser.activity-stream.showSponsoredTopSites" = false;
        "browser.download.panel.shown" = true;
        "browser.newtabpage.activity-stream.default.sites" = "https://github.com, https://test.test" ;
        "browser.newtabpage.activity-stream.system.showSponsored" = false;
        "browser.startup.homepage" = "https://www.startpage.com/do/mypage.pl?prfe=223d5083f09bc6377ea5906987b218cb912b068bc5e8b6d68952d4f0cf7273eae18b8ff358b5c1d2dc134354935b3da83071a514a26b501a644968376a65d1e5c7304ef4a703ef74b22ee107";
        "browser.startup.blankWindow" = true;
        "dom.security.https_only_mode" = true;
        "extensions.packet.showHome" = false;
        "extensions.quarantinedDomains" = false;
        "identity.fxaccounts.enabled" = false;
        "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsored" = false;
        "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "services.sync.prefs.sync.browser.startup.homepage" = false;
        "signon.rememberSignons" = false;
        "startup.homepage_welcome_url" = "www.startpage.com";
        "ui.key.menuAccessKeyFocuses" = false;
        "browser.compactmode.show" = true;
        "browser.uidensity" = 1;
      };


      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        darkreader
        df-youtube
        refined-github
        ublock-origin
        vimium
        vimium-c
        youtube-shorts-block
      ];
    };
  };
}
