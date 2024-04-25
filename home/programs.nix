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
      unstable.jdk21
      lua-language-server
      cargo-generate
      lldb
      dotnet-sdk

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
      flameshot
      sapling

      # Applications
      gimp
      inkscape
      rnote
      keepassxc
      obs-studio
      unstable.obsidian
      unstable.logseq
      unstable.geogebra
      tidal-hifi
      kdeconnect
      prismlauncher
      ungoogled-chromium # PWAs
      libreoffice
      unstable.planify
      lite-xl
      unstable.floorp

      # Communication
      (discord.override {
        withVencord = true;
      })
      unstable.thunderbird

      # Development
      python311
      gdb
      dia
      unstable.jetbrains.idea-ultimate
      unstable.jetbrains.rider
      unstable.jetbrains.rust-rover
      unstable.jetbrains-toolbox
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
