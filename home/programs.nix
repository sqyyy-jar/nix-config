{
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (inputs) devenv;
in {
  home.sessionVariables =
    {
    };

  # rustup and cargo install binaries to this path.
  home.sessionPath = ["$HOME/.cargo/bin"];

  home.packages = with pkgs;
    [
      # Development
      #devenv.packages."${system}".devenv
      rustup
      gcc
      chez
      jdk
      lua-language-server
      cargo-generate
      lldb
      unstable.dioxus-cli

      # System utilities
      ouch
      bat
      eza
      fd
      ripgrep
      tokei
      wget
      btop
      neofetch
      # Applications
      gimp
      inkscape
      rnote
      keepassxc
      obs-studio
      unstable.obsidian
      unstable.logseq
      geogebra
      tidal-hifi
      kdeconnect
      prismlauncher
      ungoogled-chromium # PWAs
      libreoffice
      unstable.planify
      lite-xl
      unstable.floorp
      unstable.anytype

      # Communication
      (discord.override {
        withVencord = true;
      })

      # Development
      python311
      gdb
      dia
      unstable.jetbrains.idea-ultimate
      unstable.jetbrains.rust-rover
      micro

      # Archives
      ark
      unrar
      unzip
      atool
      zip
      p7zip

      # System utilities
      ffmpeg
      #nix-prefetch-docker
      ntfs3g
      #pciutils
    ];
}
