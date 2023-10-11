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
      gh

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
      obsidian
      geogebra
      tidal-hifi
      kdeconnect

      # Communication
      discord

      # Development
      python311
      gdb
      dia
      unstable.jetbrains.idea-ultimate

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
