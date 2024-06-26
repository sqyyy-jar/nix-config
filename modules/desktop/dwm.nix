{pkgs, ...}: {
  services.printing.enable = true;

  sound.enable = true;
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
  ];

  programs.slock.enable = true; # Status bar

  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [hangul];
  };
}
