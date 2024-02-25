{pkgs, ...}: {
  services.xserver = {
    enable = true;

    layout = "eu";

    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
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
}
