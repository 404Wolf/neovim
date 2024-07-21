{
  description = "Cookiecutter project template collection";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
   {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        lsps = pkgs.callPackage ./lsps.nix { inherit pkgs; };
      in
      {
        packages.default = pkgs.neovim.overrideAttrs (
          finalAttrs: previousAttrs: {
            postFixup = ''
              ${previousAttrs.postFixup or ""}
              wrapProgram $out/bin/nvim \
                --argv0 neovim \
                --run 'export PATH=$PATH:${
                  pkgs.lib.makeBinPath (
                    lsps
                    ++ [
                      pkgs.gcc
                      pkgs.wl-clipboard
                      pkgs.bash
                      pkgs.nodejs_22
                    ]
                  )
                }'
            '';
          }
        );
      }
    );
}
