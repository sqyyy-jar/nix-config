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
      guile
      sbcl
      unstable.jdk23
      lua-language-server
      cargo-generate
      dotnet-sdk

      # System utilities
      ouch
      bat
      eza
      fd
      ripgrep
      tokei
      hexyl
      hyx
      wget
      btop
      neofetch
      fastfetch
      flameshot
      sapling
      google-drive-ocamlfuse
      onedrive
      fish

      # Applications
      gimp
      inkscape
      rnote
      keepassxc
      obs-studio
      unstable.obsidian
      #geogebra
      #geogebra6
      tidal-hifi
      localsend
      prismlauncher
      steam
      libreoffice
      unstable.floorp-unwrapped
      firefox-bin
      unstable.librewolf
      microsoft-edge
      unstable.pixelorama
      anki

      # Communication
      discord
      iamb
      element-desktop
      signal-desktop

      # Development
      python311
      gdb
      dia
      unstable.jetbrains.idea-ultimate
      unstable.jetbrains-toolbox
      unstable.zed-editor-fhs
      unstable.alacritty
      unstable.rio
      # vscode
      (cutter.withPlugins (ps: with ps; [ jsdec rz-ghidra sigdb ])) # Debugger
      rizin
      # unstable.imhex

      # Archives
      ark
      unrar
      unzip
      atool
      zip
      p7zip
      _7zz

      # System utilities
      ffmpeg
      #nix-prefetch-docker
      ntfs3g
      #pciutils
    ];
}
