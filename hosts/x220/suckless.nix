{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  (st.overrideAttrs (oldAttrs: rec {                               
  src = fetchFromGitHub {                                          
    owner = "d-rens";                                              
    repo = "st";                                                   
    rev = "c101106eae1a4b8bf8bf0c979ad041fd80f7d914";              
    sha256 = "PBkotjatX64Di3vN2oYJqq3dcxLE855tp7WWmtjZf6s=";       
  };                                                               
  buildInputs = oldAttrs.buildInputs ++ [ harfbuzz xorg.libX11 ];  
}))                                                                

(dwm.overrideAttrs (oldAttrs: rec {                                
  src = fetchFromGitHub {                                          
    owner = "d-rens";                                              
    repo = "dwm";                                                  
    rev = "1ebfbd66ce19fe9b1a6ee1564c8f07e2605c1ab6";              
    #sha256 = lib.fakeSha256;       
    sha256 = "sha256-0gxAbLNSNrGGsZujzlLCpDCNaG7cyV5rIdTO66R/G54=";       
  };                                                               
  buildInputs = oldAttrs.buildInputs ++ [ xorg.libX11 ];  
}))                                                                

(dmenu.overrideAttrs (oldAttrs: rec {                              
  src = fetchFromGitHub {                                          
    owner = "d-rens";                                              
    repo = "dmenu";                                                
    rev = "4321ad76663448bb26b5ac3c0c22e34bbe24cd18";              
    sha256 = "sha256-oqqXBuxtB4ZVJNnvswQqJMEzYZL4SrCTxQPYttAQzuM=";
  };                                                               
  buildInputs = oldAttrs.buildInputs ++ [ xorg.libX11 ];  
}))                                                                

(slstatus.overrideAttrs (oldAttrs: rec {                              
  src = fetchFromGitHub {                                          
    owner = "d-rens";                                              
    repo = "dwm-slstatus";                                                
    rev = "c71a0b6adbf65eaa189a210eb07e82dea16c531f";              
    sha256 = "sha256-bqX8WYBUP0AOb0tf8Ko7w20mZiwE5m07AG9yfLv1M98=";

  };                                                               
  buildInputs = oldAttrs.buildInputs ++ [ xorg.libX11 ];  
}))                                                                

];
}
