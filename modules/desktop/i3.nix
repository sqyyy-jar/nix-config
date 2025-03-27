{pkgs, ...}: {
  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.polkit.enable = true;

  # services.displayManager.defaultSession = "none+i3";

  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = true;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        rofi
        i3status
        i3lock
        i3blocks
      ];
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
  ];

  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [hangul];
  };
}
