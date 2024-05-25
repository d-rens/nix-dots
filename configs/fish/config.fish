if status is-interactive
    fish_vi_key_bindings
    # Commands to run in interactive sessions can go here
    if command -sq zoxide
    zoxide init fish | source
    else
        echo 'zoxide: command not found, please install it from https://github.com/ajeetdsouza/zoxide'
    end
end
