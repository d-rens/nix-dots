{
  config,
    pkgs,
    ...
}:
{
  environment.systemPackages = with pkgs; [
    keyd
  ];

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ 
          "0001:0001" 
        ];
        settings = {
          main = {
            capslock = "overload(control, esc)";
            # top row
             q = "f"; 
             w = "l"; 
             e = "h"; 
             r = "v"; 
             t = "z";
             y = "apostrophe";
             u = "w";
             i = "u";
             # o is still o
             p = "y";

            # home row
             a = "s";
             s = "r";
             d = "n";
             f = "t";
             g = "k";
             h = "c";
             j = "d";
             k = "e";
             l = "a";
             semicolon = "i";
             apostrophe = "semicolon";
              
            # bottom row
             z = "x";
             x = "j";
             c = "b";
             v = "m";
             b = "q";
             n = "p";
             m = "g";
          };
        };
      };
    };
  };
}
