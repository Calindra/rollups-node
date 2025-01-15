{
  description = "Rollups node";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        # packages = rec {
        #   hello = pkgs.hello;
        #   default = hello;
        # };
        # apps = rec {
        #   hello = flake-utils.lib.mkApp { drv = self.packages.${system}.hello; };
        #   default = hello;
        # };

        # Add dependencies that are only needed for development
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            go
            gopls
            gotools
            go-tools
          ];
        };

      }
    );
}
