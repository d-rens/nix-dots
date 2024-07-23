# based on https://github.com/vimjoyer/lf-nix-video
{ pkgs, config, ... }:

{
  xdg.configFile."lf/icons".source = ./icons;

  programs.lf = {
    enable = true;
    commands = {
      dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
      editor-open = ''$$EDITOR $f'';
      mkdir = ''
      ''${{
        printf "Directory Name: "
        read DIR
        mkdir $DIR
      }}
      '';
      bulkrename = ''
      ''${{
          tmpfile_old="$(mktemp)"
            tmpfile_new="$(mktemp)"

            [ -n "$fs" ] && fs=$(basename -a $fs) || fs=$(ls)

            echo "$fs" > "$tmpfile_old"
              echo "$fs" > "$tmpfile_new"
              $EDITOR "$tmpfile_new"

              [ "$(wc -l < "$tmpfile_old")" -eq "$(wc -l < "$tmpfile_new")" ] || { rm -f "$tmpfile_old" "$tmpfile_new"; exit 1; }

          paste "$tmpfile_old" "$tmpfile_new" | while IFS="$(printf '\t')" read -r src dst
            do
              [ "$src" = "$dst" ] || [ -e "$dst" ] || mv -- "$src" "$dst"
                done

                  rm -f "$tmpfile_old" "$tmpfile_new"
                  lf -remote "send $id unselect"
        }}
      '';
    };

    keybindings = {

      "\\\"" = "";
      o = "";
      c = "mkdir";
      "." = "set hidden!";
      "`" = "mark-load";
      "\\'" = "mark-load";
      "<enter>" = "open";
      
      "d" = "delete";
      "do" = "dragon-out";
      
      "g~" = "cd";
      gh = "cd";
      "g/" = "/";

      ee = "editor-open";
      V = ''$${pkgs.bat}/bin/bat --paging=always --theme=gruvbox "$f"'';

      W = "bulkrename";
      # ...
    };

    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };

    extraConfig = 
    let 
      previewer = 
        pkgs.writeShellScriptBin "pv.sh" ''
        file=$1
        w=$2
        h=$3
        x=$4
        y=$5
        
        if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
            ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
            exit 1
        fi
        
        ${pkgs.pistol}/bin/pistol "$file"
      '';
      cleaner = pkgs.writeShellScriptBin "clean.sh" ''
        ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
      '';
    in
    ''
      set cleaner ${cleaner}/bin/clean.sh
      set previewer ${previewer}/bin/pv.sh
    '';
  };

  # ...
}
