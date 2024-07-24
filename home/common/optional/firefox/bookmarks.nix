{
  ...
}:
{
  programs.firefox = {
    enable = true;

    profiles.default = {
      bookmarks = [
      {
        name = "toolbar";
        toolbar = true;
        bookmarks = [
          {
            name = "rss";
            tags = [ "news" "self-hosted" ];
            url = "http://192.168.0.137";
            keyword = "rss";
          }
          {
            name = "nextcloud";
            tags = [ "cloud" "files" "self-hosted" ];
            url = "http://nixpi.local";
            keyword = "next";
          }
          {
            name = "immich";
            tags = [ "cloud" "images" "self-hosted" ];
            url = "http://192.168.0.137:2283";
            keyword = "imm";
          }
        ];
      }
      ];
    };
  };
}
