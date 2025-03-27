{pkgs, ...}: {
  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.displayManager.defaultSession = "none+dwm";

  services.xserver = {
    enable = true;
    windowManager.dwm = {
      enable = true;
      # desktopManager.xterm.enable = true;
      package = pkgs.dwm.override {
        patches = [./patches/dwm.patch];
      };
    };
  };

  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.dbus.enable = true;

  services.flatpak.enable = true;

  services.picom.enable = true;

  hardware.keyboard.qmk.enable = true;
  services.udev.packages = [pkgs.via];

  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = "gtk";
        "org.freedesktop.impl.portal.FileChooser" = "gtk";
      };
    };
    configPackages = with pkgs; [xdg-desktop-portal-gtk];
    extraPortals = with pkgs; [xdg-desktop-portal-gtk];
    xdgOpenUsePortal = true;
  };

  environment.systemPackages = with pkgs; [
    xclip
    xfce.thunar
    feh # Wallpaper
    picom # Transparency
    (slstatus.override {
      patches = [./patches/slstatus.patch];
    }) # Status bar
    # (slock.override {
    #   patches = [./patches/slock.patch];
    # }) # Screen lock
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    gsettings-desktop-schemas
    adwaita-qt
    via
    dunst
  ];

  programs.slock.enable = true; # Status bar
  programs.dconf.enable = true;

  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [hangul];
  };
}
