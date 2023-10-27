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

      # System utilities
      ouch
      bat
      exa
      fd
      ripgrep
      tokei
      wget
      btop
      neofetch
      # Applications
      gimp
      keepassxc
      obs-studio
      unstable.obsidian
      geogebra
      tidal-hifi
      kdeconnect
      prismlauncher
      vivaldi

      # Communication
      discord

      # Development
      python311
      gdb
      dia
      unstable.jetbrains.idea-ultimate
      unstable.jetbrains.rust-rover

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
