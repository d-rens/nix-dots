{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    fish
  ];
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting 
      fish_vi_key_bindings 
      zoxide init fish | source
    '';

    functions = {
      __fish_command_not_found_handler = {
        body = "__fish_default_command_not_found_handler $argv[1]";
        onEvent = "fish_command_not_found";
      };
      gitignore = "curl -sL https://www.gitignore.io/api/$argv";
    };

    shellAliases = {
      g = "git";
    };
  };
}
