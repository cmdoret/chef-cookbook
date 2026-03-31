{
  description = "Development environment for typst.";
  inputs = { 
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      nativeBuildInputs = with pkgs; [
        bash
        coreutils
        curl
        findutils
        git
        jq
        just
        typst
      ];

      fontsConf = pkgs.makeFontsConf {
        fontDirectories = with pkgs; [
          paratype-pt-serif
          paratype-pt-sans
          nerd-fonts.jetbrains-mono
          helvetica-neue-lt-std
          noto-fonts-color-emoji
          noto-fonts-cjk-sans
          font-awesome
        ];
      };
    in
    {
      # Development environment with necessary tools and fonts.
      devShells.default = pkgs.mkShell {
        inherit nativeBuildInputs;
        shellHook = ''
          set -euo pipefail
          
          # Allows typst to access current time.
          unset SOURCE_DATE_EPOCH
          # Set the font configuration for typst.
          export FONTCONFIG_FILE="${fontsConf}"
       '';
      };
    }
  );
}
