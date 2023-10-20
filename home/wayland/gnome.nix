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

    # Extensions
    gnomeExtensions.appindicator
  ];
}
