{pkgs, ...}: {
  home.packages = with pkgs; [nil alejandra black unstable.ruff];

  programs.vscode = {
    enable = true;

    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    userSettings = {
      "editor.fontSize" = 15;
      "editor.fontFamily" = "'Fira Code Nerd Font', 'Droid Sans Mono', 'monospace'";
      "editor.fontLigatures" = true;
      "editor.selectionClipboard" = false;
      "editor.inlayHints.enabled" = "off";
      "editor.formatOnSave" = true;
      # NOTE: Depends on the `antfu.theme-vitesse` extension.
      "workbench.colorTheme" = "Vitesse Dark";
      "workbench.startupEditor" = "none";
      "search.useGlobalIgnoreFiles" = true;
      "extensions.autoUpdate" = false;

      "rust-analyzer.rustfmt.rangeFormatting.enable" = true;
      "rust-analyzer.check.command" = "clippy";
      "rust-analyzer.inlayHints.lifetimeElisionHints.enable" = "skip_trivial";
      "rust-analyzer.server.path" = "/etc/profiles/per-user/sqyyy/bin/rust-analyzer";

      # NOTE: Depends on the `ruff` package.
      "ruff.path" = ["ruff"];

      "nix.enableLanguageServer" = true;
      # NOTE: Depends on the `nil` package.
      "nix.serverPath" = "nil";
      "[nix]" = {
        # NOTE: Depends on the `alejandra` package.
        "editor.defaultFormatter" = "kamadorueda.alejandra";
        "editor.formatOnSave" = true;
      };

      "editor.quickSuggestions" = {
        "other" = "inline";
      };

      # NOTE: Depends on the `vim` package.
      "vim.useSystemClipboard" = true;

    };

    extensions = with pkgs.unstable.vscode-extensions; [
      editorconfig.editorconfig
      jnoortheen.nix-ide
      kamadorueda.alejandra
      mkhl.direnv
      tamasfe.even-better-toml
      rust-lang.rust-analyzer
      vscodevim.vim
      # vadimcn.vscode-lldb
    ];
  };
}
