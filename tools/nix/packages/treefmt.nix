{
  inputs,
  pkgs,
  ...
}:
let
  # Configure formatter.
  treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs {
    projectRootFile = ".git/config";
    settings.global.excludes = [ "external/*" ];

    # Markdown, JSON, YAML, etc.
    programs.prettier.enable = true;

    # Toml
    programs.taplo.enable = true;

    # Typst
    programs.typstyle = {
      enable = true;
      indentWidth = 2;
      lineWidth = 80;
    };

    # Shell.
    programs.shfmt = {
      enable = true;
      indent_size = 4;
    };

    programs.shellcheck.enable = true;
    settings.formatter.shellcheck = {
      options = [
        "-e"
        "SC1091"
      ];
    };

    # Nix.
    programs.nixfmt.enable = true;
  };

  treefmt = treefmtEval.config.build.wrapper;
in
treefmt
