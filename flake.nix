{
  description = "Jekyll development environment for th1enq.github.io";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            ruby
            bundler
            gcc
            pkg-config
            libffi
          ];

          shellHook = ''
            echo "Jekyll development environment loaded"
            bundle install --local 2>/dev/null || bundle install
          '';
        };
      }
    );
}
