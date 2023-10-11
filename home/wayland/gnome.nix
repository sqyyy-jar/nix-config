{
  inputs,
  pkgs,
  system,
  ...
}: let
  inherit (builtins) concatStringsSep genList toString;
in {
  home.packages = with pkgs; [
    # Screenshots and screen recording.
    slurp
    grim
    wf-recorder
    wlr-randr
    wl-clipboard

    # Miscellaneous utilities.
    #pciutils
    imv
  ];

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
}
