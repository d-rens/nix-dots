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
          url = "192.168.0.190:8040";
          keyword = "rss";
        }
        ];
      }
      ];
    };
  };
}
