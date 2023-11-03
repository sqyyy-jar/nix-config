{pkgs, ...}: {
  services.xserver = {
    enable = true;

    layout = "eu";

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [ gnomeExtensions.appindicator ];

  services.dbus.packages = with pkgs; [ gnome.gnome-settings-daemon ];
}
