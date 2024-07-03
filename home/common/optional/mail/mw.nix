{ pkgs, ... }:

{
  programs.neomutt = {
    enable = true;
    binds = [
    { action = "noop"; key = "<space>"; map = "editor"; }
    { action = "noop"; key = "C"; map = ["index" "pager"]; }
    { action = "noop"; key = "M"; map = ["index" "pager"]; }
    { action = "noop"; key = "\Cf"; map = "index"; }
    { action = "noop"; key = "g"; map = ["index" "pager"]; }
    { action = "noop"; key = "h"; map = "index"; }
    { action = "noop"; key = "i"; map = ["index" "pager"]; }
    { action = "bottom-page"; key = "G"; map = ["pager" "browser"]; }
    { action = "complete-query"; key = "<Tab>"; map = "editor"; }
    { action = "delete-message"; key = "D"; map = "index"; }
    { action = "display-message"; key = "l"; map = "index"; }
    { action = "exit"; key = "h"; map = ["pager" "attach"]; }
    { action = "first-entry"; key = "gg"; map = "index"; }
    { action = "group-reply"; key = "R"; map = ["index" "pager"]; }
    { action = "half-down"; key = "d"; map = ["index" "pager" "browser"]; }
    { action = "half-up"; key = "u"; map = ["index" "pager" "browser"]; }
    { action = "last-entry"; key = "G"; map = "index"; }
    { action = "limit"; key = "L"; map = "index"; }
    { action = "next-entry"; key = "j"; map = "index"; }
    { action = "next-line"; key = "\005"; map = "pager"; }
    { action = "next-line"; key = "j"; map = "pager"; }
    { action = "next-undeleted"; key = "\005"; map = "index"; }
    { action = "previous-entry"; key = "k"; map = "index"; }
    { action = "previous-line"; key = "\031"; map = "pager"; }
    { action = "previous-line"; key = "k"; map = "pager"; }
    { action = "previous-undeleted"; key = "\031"; map = "index"; }
    { action = "select-entry"; key = "l"; map = "browser"; }
    { action = "sidebar-next"; key = "\Cj"; map = ["index" "pager"]; }
    { action = "sidebar-next-new"; key = "\Cn"; map = ["index" "pager"]; }
    { action = "sidebar-open"; key = "\Co"; map = ["index" "pager"]; }
    { action = "sidebar-prev"; key = "\Ck"; map = ["index" "pager"]; }
    { action = "sidebar-prev-new"; key = "\Cp"; map = ["index" "pager"]; }
    { action = "sidebar-toggle-visible"; key = "B"; map = ["index" "pager"]; }
    { action = "sync-mailbox"; key = "S"; map = ["index" "pager"]; }
    { action = "tag-entry"; key = "<space>"; map = ["index" "query"]; }
    { action = "top-page"; key = "gg"; map = ["pager" "browser"]; }
    { action = "undelete-message"; key = "U"; map = "index"; }
    { action = "view-attachments"; key = "l"; map = "pager"; }
    { action = "view-mailcap"; key = "<return>"; map = "attach"; }
    { action = "view-mailcap"; key = "l"; map = "attach"; }
    { action = "view-raw-message"; key = "H"; map = ["index" "pager"]; }
    ];


    extraConfig = ''
#set display_filter = "tac | sed '/\\\[-- Autoview/,+1d' | tac" # Suppress autoview messages.
      alternative_order text/plain text/enriched text/html
      auto_view application/pgp-encrypted
      auto_view text/html		# automatically show html (mailcap uses lynx)
      color bold black default
      color error red default
      color hdrdefault brightgreen default
      color header blue default ".*"
      color header brightcyan default "^Subject"
      color header brightmagenta default "^From"
      color header brightwhite default "^(CC|BCC)"
      color index brightyellow black "~N"
      color index brightyellow blue "~T"
      color index yellow default '.*'
      color index_author brightred black "~N"
      color index_author brightred blue "~T"
      color index_author red default '.*'
      color index_number blue default
      color index_subject brightcyan black "~N"
      color index_subject brightcyan blue "~T"
      color index_subject cyan default '.*'
      color indicator brightblack white
      color markers red white
      color message cyan default
      color normal brightyellow default
      color normal default default
      color quoted green default
      color quoted1 blue default
      color quoted2 cyan default
      color quoted3 yellow default
      color quoted4 red default
      color quoted5 brightred default
      color search brightmagenta default
      color sidebar_divider brightblack black
      color sidebar_flagged red black
      color sidebar_highlight red default
      color sidebar_new green black
      color signature brightgreen default
      color status brightyellow black
      color tilde black default
      color underline black default
      set date_format="%y/%m/%d %I:%M%p"
      set fast_reply			# skip to compose when replying
      set fcc_attach			# save attachments with the body
      set forward_format = "Fwd: %s"	# format of subject when forwarding
      set forward_quote		# include message in forwards
      set include			# include message in replies
      set index_format="%2C %Z %?X?A& ? %D %-15.15F %s (%-4.4c)"
      set mail_check=60 # to avoid lags using IMAP with some email providers (yahoo for example)
      set mailcap_path = $HOME/.config/neomutt/mailcap:/nix/store/q8zbybmmk8mhls57fxxqq32yj9hd4wyr-mutt-wizard-3.3.1/share/mutt-wizard/mailcap:$mailcap_path
      set mark_old = no		# Unread mail stay unread until read
      set markers = no		# Disables the `+` displayed at line wraps
      set mime_forward = yes		# attachments are forwarded with mail
      set mime_type_query_command = "file --mime-type -b %s"
      set query_command = "abook --mutt-query '%s'"
      set reverse_name		# reply as whomever it was to
      set rfc2047_parameters = yes
      set sidebar_visible = yes
      set sleep_time = 0		# Pause 0 seconds for informational messages
      set smtp_authenticators = 'gssapi:login'
      set sort = 'reverse-date'
      set wait_key = no		# mutt won't ask "press key to continue"

      bind index,pager B sidebar-toggle-visible
      bind index,pager \Cj sidebar-next
      bind index,pager \Ck sidebar-prev
      bind index,pager \Cn sidebar-next-new
      bind index,pager \Co sidebar-open
      bind index,pager \Cp sidebar-prev-new

      color attachment white default
      color body brightblack default "^gpg: Good signature .*"
      color body brightblue default "(https?|ftp)://[\-\.,/%~_:?&=\#a-zA-Z0-9]+" # URL
      color body brightblue default "^# \.*" # Headings as bold blue
      color body brightcyan default "[ ]?[*][^*]*[*][ ]" # more emoticon?
      color body brightcyan default "[ ][*][^*]*[*][ ]?" # more emoticon?
      color body brightcyan default "[;:][)(|]" # emoticons
      color body brightcyan default "[;:][-o][)/(|]" # emoticons
      color body brightcyan default "^## \.*" # Subheadings as bold cyan
      color body brightgreen default "^### \.*" # Subsubheadings as bold green
      color body brightred default "[\-\.+_a-zA-Z0-9]+@[\-\.a-zA-Z0-9]+" # Email addresses
      color body brightyellow default "^gpg: "
      color body brightyellow red "^gpg: BAD signature from.*"
      color body cyan default "(Good signature)"
      color body green default "\`[^\`]*\`" # Green text between ` and `
      color body red default "(BAD signature)"
      color body red default "([a-z][a-z0-9+-]*://(((([a-z0-9_.!~*'();:&=+$,-]|%[0-9a-f][0-9a-f])*@)?((([a-z0-9]([a-z0-9-]*[a-z0-9])?)\\.)*([a-z]([a-z0-9-]*[a-z0-9])?)\\.?|[0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+)(:[0-9]+)?)|([a-z0-9_.!~*'()$,;:@&=+-]|%[0-9a-f][0-9a-f])+)(/([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*(;([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*)*(/([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*(;([a-z0-9_.!~*'():@&=+$,-]|%[0-9a-f][0-9a-f])*)*)*)?(\\?([a-z0-9_.!~*'();/?:@&=+$,-]|%[0-9a-f][0-9a-f])*)?(#([a-z0-9_.!~*'();/?:@&=+$,-]|%[0-9a-f][0-9a-f])*)?|(www|ftp)\\.(([a-z0-9]([a-z0-9-]*[a-z0-9])?)\\.)*([a-z]([a-z0-9-]*[a-z0-9])?)\\.?(:[0-9]+)?(/([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*(;([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*)*(/([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*(;([-a-z0-9_.!~*'():@&=+$,]|%[0-9a-f][0-9a-f])*)*)*)?(\\?([-a-z0-9_.!~*'();/?:@&=+$,]|%[0-9a-f][0-9a-f])*)?(#([-a-z0-9_.!~*'();/?:@&=+$,]|%[0-9a-f][0-9a-f])*)?)[^].,:;!)? \t\r\n<>\"]"
      color body yellow default "^(\t| )*(-|\\*) \.*" # List items as yellow
      color bold black default
      color error red default
      color hdrdefault brightgreen default
      color header blue default ".*"
      color header brightcyan default "^Subject"
      color header brightmagenta default "^From"
      color header brightwhite default "^(CC|BCC)"
      color index brightyellow black "~N"
      color index brightyellow blue "~T"
      color index yellow default '.*'
      color index_author brightred black "~N"
      color index_author brightred blue "~T"
      color index_author red default '.*'
      color index_number blue default
      color index_subject brightcyan black "~N"
      color index_subject brightcyan blue "~T"
      color index_subject cyan default '.*'
      color indicator brightblack white
      color markers red white
      color message cyan default
      color normal brightyellow default
      color normal default default
      color normal default default
      color quoted green default
      color quoted1 blue default
      color quoted2 cyan default
      color quoted3 yellow default
      color quoted4 red default
      color quoted5 brightred default
      color search brightmagenta default
      color sidebar_divider brightblack black
      color sidebar_flagged red black
      color sidebar_highlight red default
      color sidebar_new green black
      color signature brightgreen default
      color status brightyellow black
      color tilde black default
      color underline black default
      mono body bold "^gpg: BAD signature from.*"
      mono body bold "^gpg: Good signature"
      mono bold bold
      mono error bold
      mono indicator reverse
      mono underline underline
      set mail_check_stats
      set sidebar_format = '%D%?F? [%F]?%* %?N?%N/? %?S?%S?'
      set sidebar_next_new_wrap = yes
      set sidebar_short_path = yes
      set sidebar_width = 20

      macro browser h '<change-dir><kill-line>..<enter>' "Go to parent folder"
      macro index A "<limit>all\n" "show all messages (undo limit)"
      macro index O "<shell-escape>mw -Y<enter>" "run mw -Y to sync all mail"
      macro index \Cf "<enter-command>unset wait_key<enter><shell-escape>printf 'Enter a search term to find with notmuch: '; read x; echo \$x >~/.cache/mutt_terms<enter><limit>~i \"\`notmuch search --output=messages \$(cat ~/.cache/mutt_terms) | head -n 600 | perl -le '@a=<>;s/\^id:// for@a;$,=\"|\";print@a' | perl -le '@a=<>; chomp@a; s/\\+/\\\\+/ for@a;print@a' \`\"<enter>" "show only messages matching a notmuch pattern"
      macro index \Cr "T~U<enter><tag-prefix><clear-flag>N<untag-pattern>.<enter>" "mark all messages as read"
      macro index,pager Ca ";<copy-message>=Archive<enter>" "copy mail to archive"
      macro index,pager Cd ";<copy-message>=Drafts<enter>" "copy mail to drafts"
      macro index,pager Ci ";<copy-message>=INBOX<enter>" "copy mail to inbox"
      macro index,pager Cj ";<copy-message>=Junk<enter>" "copy mail to junk"
      macro index,pager Cs ";<copy-message>=Sent<enter>" "copy mail to sent"
      macro index,pager Ct ";<copy-message>=Trash<enter>" "copy mail to trash"
      macro index,pager Ma ";<save-message>=Archive<enter>" "move mail to archive"
      macro index,pager Md ";<save-message>=Drafts<enter>" "move mail to drafts"
      macro index,pager Mi ";<save-message>=INBOX<enter>" "move mail to inbox"
      macro index,pager Mi ";<save-message>=git<enter>" "move mail to git"
      macro index,pager Mj ";<save-message>=Junk<enter>" "move mail to junk"
      macro index,pager Ms ";<save-message>=Sent<enter>" "move mail to sent"
      macro index,pager Mt ";<save-message>=Trash<enter>" "move mail to trash"
      macro index,pager a "<enter-command>set my_pipe_decode=\$pipe_decode pipe_decode<return><pipe-message>abook --add-email<return><enter-command>set pipe_decode=\$my_pipe_decode; unset my_pipe_decode<return>" "add the sender address to abook"
      macro index,pager ga "<change-folder>=Archive<enter>" "go to archive"
      macro index,pager gd "<change-folder>=Drafts<enter>" "go to drafts"
      macro index,pager gi "<change-folder>=INBOX<enter>" "go to inbox"
      macro index,pager gG "<change-folder>=git<enter>" "go to git"
      macro index,pager gj "<change-folder>=Junk<enter>" "go to junk"
      macro index,pager gs "<change-folder>=Sent<enter>" "go to sent"
      macro index,pager gt "<change-folder>=Trash<enter>" "go to trash"
      '';
  };
}
