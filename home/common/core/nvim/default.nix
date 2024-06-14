{ configs, pkgs, inputs, ... }:

{
  #imports = [
  #  
  #];
  
  home.packages =  with pkgs; [
    inputs.Neve.packages.${system}.default
  ];

  #programs.nixvim = {
  #  enable = true;
  #}; 

}
