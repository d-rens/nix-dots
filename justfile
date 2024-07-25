# variables seem to be set with
# name := "value"

default:
  @just --list

# this will update the t470 host
update:
  sudo nixos-rebuild switch -vvv 

t:
  --flake .#t470

# this installs the 6
install:
  sudo nixos-install -vvv --flake .#t470
