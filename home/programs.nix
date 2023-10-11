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

      # System utilities
      ouch
      bat
      exa
      fd
      ripgrep
      tokei
      wget
      # Applications
      gimp
      keepassxc
      obs-studio

      # Communication
      discord

      # Development
      python311
      gdb
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
