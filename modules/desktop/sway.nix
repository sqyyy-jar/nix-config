{pkgs, ...}: {
  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    wacom.enable = true;
    # displayManager.extraSessionFilePackages = [pkgs.sway];
  };

  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    dbus   # make dbus-update-activation-environment available in the path
    # dbus-sway-environment
    # configure-gtk
    wayland
    xdg-utils # for opening default programs when clicking links
    glib # gsettings
    dracula-theme # gtk theme
    gnome3.adwaita-icon-theme  # default gnome cursors
    swaylock
    swayidle
    fuzzel # application launcher
    rofi-wayland # "
    xfce.thunar
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    # slurp
    # grim
    # wf-recorder
    # wlr-randr
    xdg-desktop-portal-wlr
    mako # notification system developed by swaywm maintainer
    wdisplays # tool to configure displays
    brightnessctl # brightness configuration
    pulseaudio # volume configuration
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}
