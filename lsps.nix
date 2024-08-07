{ pkgs }:
[
  pkgs.ltex-ls
  pkgs.coreutils-full
  pkgs.nodejs_22
  pkgs.git
  pkgs.nodePackages.prettier
  pkgs.luajitPackages.lua-lsp
  pkgs.lua-language-server
  pkgs.pyright
  pkgs.luarocks-nix
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
  pkgs.texlab
  pkgs.nil
  pkgs.nixd
  pkgs.alejandra
  (pkgs.symlinkJoin {
    name = "latex-indent";
    paths = [ pkgs.perl538Packages.LatexIndent ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      ln -s $out/bin/latexindent.pl $out/bin/latexindent
    '';
  })
]
