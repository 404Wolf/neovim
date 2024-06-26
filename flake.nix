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
      in
      {
        packages.default = pkgs.neovim.overrideAttrs (
          finalAttrs: previousAttrs: {
            postFixup = ''
              ${previousAttrs.postFixup or ""}
              wrapProgram $out/bin/nvim \
                --set PATH $PATH:${
                  pkgs.lib.makeBinPath [
                    pkgs.gcc
                    pkgs.bash
                    pkgs.coreutils-full
                    pkgs.nodejs_22
                    pkgs.git
                    pkgs.nixd
                    pkgs.nodePackages.prettier
                    pkgs.nodePackages_latest.typescript-language-server
                    pkgs.luajitPackages.lua-lsp
                    pkgs.lua-language-server
                    pkgs.basedpyright
                    pkgs.stylua
                    pkgs.prettierd
                    pkgs.nixfmt-rfc-style
                    pkgs.black # Python formatter
                    pkgs.isort # Python import sorter
                    pkgs.go_1_21 # Go formatter
                    pkgs.nodePackages_latest.bash-language-server
                    pkgs.yaml-language-server
                    pkgs.vscode-langservers-extracted
                    pkgs.gosimports
                    pkgs.typescript
                    pkgs.nodePackages_latest.typescript-language-server
                    pkgs.beautysh
                    pkgs.rustc
                    pkgs.cargo
                    pkgs.rust-analyzer
                    pkgs.ripgrep
                    pkgs.fd
                    pkgs.rustfmt
                    pkgs.taplo
                    pkgs.pandoc
                    pkgs.tree-sitter
                    pkgs.wl-clipboard
                    pkgs.xclip
                  ]
                }
            '';
          }
        );
      }
    );
}
