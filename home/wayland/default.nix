{...}: {
  # This enables Wayland support for most Chrome and Electron apps.
  home.sessionVariables.NIXOS_OZONE_WL = "1";
  home.sessionVariables.QT_QPA_PLATFORM = "wayland";

  imports = [
    ./gnome.nix
  ];
}
