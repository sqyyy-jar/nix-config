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
      unstable.jdk22
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
      hexyl
      wget
      btop
      neofetch
      flameshot
      sapling
      google-drive-ocamlfuse

      # Applications
      gimp
      inkscape
      rnote
      keepassxc
      obs-studio
      unstable.obsidian
      unstable.logseq
      #geogebra
      #geogebra6
      tidal-hifi
      kdeconnect
      prismlauncher
      libreoffice
      lite-xl
      unstable.floorp-unwrapped
      firefox-bin

      # Communication
      discord
      unstable.zulip
      unstable.zulip-term
      unstable.thunderbird
      iamb
      element-desktop

      # Development
      python311
      gdb
      dia
      unstable.jetbrains.idea-ultimate
      unstable.jetbrains-toolbox
      unstable.zed-editor
      unstable.alacritty
      cutter # Debugger
      unstable.imhex

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
