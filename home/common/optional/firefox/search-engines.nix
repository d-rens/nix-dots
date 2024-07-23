{
  pkgs,
  ...
}:
let
snowflake = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake-white.svg";
in
{
  programs.firefox = {
    enable = true;

    profiles.default = {
      search = {
        force = true;

        default = "Starting Page";
        order = [
          "Starting Page"
        ];

        engines = {
          # default
          "Starting Page" = {
            urls = [{
              template = "https://www.startpage.com/do/search";
              params = [
              { name = "query"; value = "{searchTerms}"; }
              ];
            }];
          };

          "Nix Packages" = {
            icon = snowflake;
            definedAliases = [ "@nixp" ];
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
              { name = "category"; value = "general"; }
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

          "arxiv" = {
              definedAliases = [ "@ar" ];
              urls = [{ template = "https://arxiv.org/search/?query={searchTerms}&searchtype=all&abstracts=show&order=-announced_date_first&size=50"; }];
            };

          "CTAN" = {
              definedAliases = [ "@ctan" ];
              urls = [{ template = "https://ctan.org/search?phrase={searchTerms}"; }];
          };

          "Bing".metaData.hidden = true;
          "Google".metaData.hidden = true;
          "DuckDuckGo".metaData.hidden = true;
        };

      };
    };
  };
}
