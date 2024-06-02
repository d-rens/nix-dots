{ config, pkgs, lib, ... }:
{
  programs.newsboat = {
    enable = true;
    autoReload = true;
    extraConfig = ''
      bind-key l open
      bind-key h quit
      bind-key j down
      bind-key k up
      bind-key J next-feed articlelist
      bind-key K prev-feed articlelist
      bind-key G end
      bind-key g home
      bind-key a toggle-article-read
      bind-key n next-unread
      bind-key U show-urls
      feed-sort-order unreadarticlecount-asc
    '';
    urls = [
      # Blogs
      {
        tags = [ "blog" ];
        url = "https://100r.co/links/rss.xml";
      }
      {
        tags = [ "blog" ];
        url = "https://250bpm.com/rss";
      }
      {
        tags = [ "blog" ];
        url = "https://amugofinsights.substack.com/feed";
      }
      {
        tags = [ "blog" ];
        url = "https://berthub.eu/articles/index.xml";
      }
      {
        tags = [ "blog" ];
        url = "https://blog.fefe.de/rss.xml?html";
      }
      {
        tags = [ "blog" ];
        url = "https://boosungkim.com/feed.xml";
      }
      {
        tags = [ "blog" ];
        url = "https://computer.rip/rss.xml";
      }
      {
        tags = [ "blog" ];
        url = "https://d-rens.xyz/index.xml";
      }
      {
        tags = [ "blog" ];
        url = "https://feeds.exozy.me/rss.xml";
      }
      {
        tags = [ "blog" ];
        url = "https://hans.gerwitz.com/feeds/writing.rss";
      }
      {
        tags = [ "blog" ];
        url = "https://jlelse.blog/feed";
      }
      {
        tags = [ "blog" ];
        url = "https://johnnydecimal.com/rss.xml";
      }
      {
        tags = [ "blog" ];
        url = "https://jvns.ca/atom.xml";
      }
      {
        tags = [ "blog" ];
        url = "https://k0.tel/feed.xml";
      }
      {
        tags = [ "blog" ];
        url = "https://kevinjalbert.com/feed";
      }
      {
        tags = [ "blog" ];
        url = "https://landchad.net/index.xml";
      }
      {
        tags = [ "blog" ];
        url = "https://lukesmith.xyz/index.xml";
      }
      {
        tags = [ "blog" ];
        url = "https://neocities.org/site/thricegreat.rss";
      }
      {
        tags = [ "blog" ];
        url = "https://neomutt.org/feed.xml";
      }
      {
        tags = [ "blog" ];
        url = "https://ratfactor.com/atom.xml";
      }
      {
        tags = [ "blog" ];
        url = "https://research.swtch.com/feed.atom";
      }
      {
        tags = [ "blog" ];
        url = "https://sheafification.com/rss";
      }
      {
        tags = [ "blog" ];
        url = "https://sizeof.life/index.xml";
      }
      {
        tags = [ "blog" ];
        url = "https://suckless.org/atom.xml";
      }
      {
        tags = [ "blog" ];
        url = "https://www.getmonero.org/feed.xml";
      }
      {
        tags = [ "blog" ];
        url = "https://www.kuketz-blog.de/feed/";
      }
      {
        tags = [ "blog" ];
        url = "https://www.schneier.com/feed/atom";
      }
      {
        tags = [ "blog" ];
        url = "https://www.yegor256.com/rss.xml";
      }
      {
        tags = [ "blog" ];
        url = "https://zettelkasten.de/feed";
      }
      
      # Podcasts
      {
        tags = [ "podcast" ];
        url = "https://lagedernation.org/rss";
      }
      {
        tags = [ "podcast" ];
        url = "https://lexfridman.com/feed/podcast/";
      }
      
      # News
      {
        tags = [ "news" ];
        url = "https://de.wikipedia.org/w/api.php?action=featuredfeed&feed=featured&feedformat=atom";
      }
      {
        tags = [ "news" ];
        url = "https://journals.sagepub.com/action/showFeed?ui=0&mi=ehikzz&ai=2b4&jc=rera&type=etoc&feed=rss";
      }
      {
        tags = [ "news" ];
        url = "https://mailbox.org/share/feed-en-mailbox.xml";
      }
      
      # Technical Articles
      {
        tags = [ "technical" ];
        url = "https://gohugo.io/index.xml";
      }
      {
        tags = [ "technical" ];
        url = "https://tug.org/rss/tug.xml";
      }
      {
        tags = [ "technical" ];
        url = "https://www.latex-project.org/feed.xml";
      }
      
      # YouTube Channels
      {
        tags = [ "youtube" ];
        url = "https://invidious.privacyredirect.com/feed/channel/UCovndCJjH4fO1DW_ZnM0cZw";
      }
      {
        tags = [ "youtube" ];
        url = "https://invidious.privacyredirect.com/feeds/videos.xml?channel_id=UCKzJFdi57J53Vr_BkTfN3uQ";
      }
      {
        tags = [ "youtube" ];
        url = "https://invidious.privacyredirect.com/feeds/videos.xml?channel_id=UCRb6Mw3fJ6OFzp-cB9X29aA";
      }
      {
        tags = [ "youtube" ];
        url = "https://invidious.privacyredirect.com/feeds/videos.xml?channel_id=UCafEZMU5s8geb9oIly6xTrg";
      }
      {
        tags = [ "youtube" ];
        url = "https://invidious.privacyredirect.com/feeds/videos.xml?channel_id=UCcaTUtGzOiS4cqrgtcsHYWg";
      }
      {
        tags = [ "youtube" ];
        url = "https://invidious.privacyredirect.com/feeds/videos.xml?channel_id=UChd2vv9wZK88g2p7jNT-REg";
      }
      {
        tags = [ "youtube" ];
        url = "https://invidious.privacyredirect.com/feeds/videos.xml?channel_id=UChyA7V9WtsvnjZHSeOQFXMg";
      }
      {
        tags = [ "youtube" ];
        url = "https://invidious.privacyredirect.com/feeds/videos.xml?channel_id=UCoHhuummRZaIVX7bD4t2czg";
      }
    ];
  };
}

