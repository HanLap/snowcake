{ pkgs }: 
let
  inherit (pkgs) callPackage;
in
{
  headsetcontrol = callPackage ./headsetcontrol { };
  headsetcontrol-udev-rules = callPackage ./headsetcontrol-udev-rules { };
}
