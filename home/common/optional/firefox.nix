{
  pkgs,
  inputs,
  ...
}:
let
  snowflake = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
in
{
  programs.firefox = {
    enable = true;

    profiles.default = {
      search.engines = {
      # to be added: pubmed, nix options, nix packages, home-manager settings, nix discourse, pubmed, arxiv, searxng, wiby
        "Nix Packages" = {
          icon = snowflake;
          definedAliases = [ "@nixp" ];
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];
        };

        "Nix options" = {
          icon = snowflake;
          definedAliases = [ "@nixo" ];
          urls = [{
            template = "https://search.nixos.org/options";
            params = [
              { name = "type"; value = "options"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];
        };

        "Nix forum" = {
          icon = snowflake;
          definedAliases = [ "@nixf" ];
          urls = [{
            template = "https://discourse.nixos.org/";
            params = [
              { name = "type"; value = "forum"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];
        };

        "home-manager" = {
          definedAliases = [ "@nixh" ];
          icon = snowflake;
          urls = [{
            template = "https://home-manager-options.extranix.com/";
            params = [
            { name = "type"; value = "home options"; }
            { name = "query"; value = "{searchTerms}"; }
            ];
          }];
        };
      };
      search.force = true;

      bookmarks = [
        {
          name = "toolbar";
          toolbar = true;
          bookmarks = [
            {
              name = "homepage";
              url = "https://nixos.org/";
            }
            {
              name = "wiki";
              tags = [ "wiki" "nix" ];
              url = "https://wiki.nixos.org/";
            }
          ];
        }
      ];

      
      settings = {
        "browser.download.panel.shown" = true;
        "dom.security.https_only_mode" = true;
        "extensions.quarantinedDomains" = false;
        "identity.fxaccounts.enabled" = false;
        "signon.rememberSignons" = false;
      };

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        darkreader
        vimium
        youtube-shorts-block
      ];
    };
  };
}
