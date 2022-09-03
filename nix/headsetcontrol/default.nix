{ pkgs }:
let
  inherit (pkgs) stdenv;
in 
stdenv.mkDerivation {
  name = "headsetcontrol";
  version = "2.6.1";

  src = pkgs.fetchurl {
    url = "https://github.com/Sapd/HeadsetControl/archive/refs/tags/2.6.1.tar.gz";
    sha256 = "E+SzLVlm4WbkS8+4UpTuCNYANIQ37uO1Dnz6HKluYrU=";
  };

  buildInputs = with pkgs; [
    cmake
    hidapi
  ];

  configurePhase = ''
    mkdir build
    cd build
    cmake ..
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp headsetcontrol $out/bin
  '';
}
