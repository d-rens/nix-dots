{ 
  ... 
}:
{
  home.file = {
    ".config/neomutt/accounts/main.muttrc".text = ''
      set realname = "Daniel Renschler"
      set from = "daniel@d-rens.xyz"
      set sendmail = "msmtp -a daniel@d-rens.xyz"
      alias me daniel <daniel@d-rens.xyz>
      set folder = "/home/da/.local/share/mail/personal/";
      set header_cache = /home/da/.cache/mail/daniel@d-rens.xyz/headers
      set message_cachedir = /home/da/.cache/mail/daniel@d-rens.xyz/bodies
      set mbox_type = Maildir
      set hostname = "d-rens.xyz"

      unset hostname
      unmy_hdr Organization
      unmailboxes *
      unalternates *
      unset signature

      set spoolfile = +Inbox
      set postponed = +Drafts
      set trash = +Trash
      set record = +Sent

      macro index o "<shell-escape>mbsync personal<enter>" "syncing mailbox"

      mailboxes "=Inbox" "=Drafts" "=Sent" "=git" "=Junk" "=Trash"
      '';



    ".config/neomutt/accounts/sec.muttrc".text = ''
      set realname = "Daniel Renschler"
      set from = "d-rens@mailbox.org"
      set sendmail = "msmtp -a d-rens@mailbox.org"
      alias me d-rens <d-rens@mailbox.org>
      set folder = "/home/da/.local/share/mail/secondary/"
      set header_cache = /home/da/.cache/mail/d-rens@mailbox.org/headers
      set message_cachedir = /home/da/.cache/mail/d-rens@mailbox.org/bodies
      set mbox_type = Maildir
      set hostname = "mailbox.org"
      unset hostname
      unmy_hdr Organization
      unmailboxes *
      unalternates *
      unset signature
      set spoolfile = +Inbox
      set postponed = +Drafts
      set trash = +Trash
      set record = +Sent

      macro index o "<shell-escape>mbsync secondary<enter>" "syncing mailbox"

      mailboxes "=Inbox" "=lists" "=Sent" "=Drafts" "=Junk" "=Trash"
      '';
  };
}
