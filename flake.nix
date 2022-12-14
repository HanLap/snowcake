{
  description = "My Personal flake";

  inputs = {
     nixpkgs.url = "github:NixOS/nixpkgs";
     flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: 
  {
    overlay = import ./overlay.nix {};
  }
  //
  (
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;

          overlays = [ self.overlay ];
        };
      in
      {
        legacyPackages = pkgs.snowcake;

        packages = flake-utils.lib.flattenTree pkgs.snowcake;
      }
    )
  );
}
