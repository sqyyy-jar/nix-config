{
  config,
  pkgs,
  ...
}: {
  # Make sure nouveau never runs alongside the official driver.
  boot.blacklistedKernelModules = [ "nouveau" ];

  # Configure the video driver to use on Wayland and X11.
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable Vulkan support.
  environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
  ];

  # Recommended environment variables for enhanced experience.
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  # Hardware configuration for NVIDIA GPUs.
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [nvidia-vaapi-driver];
    };

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      # package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;

      # forceFullCompositionPipeline = true;
    };
  };

  services.xserver.config = ''
    Section "Monitor"
        # HorizSync source: edid, VertRefresh source: edid
        Identifier     "Monitor0"
        VendorName     "Unknown"
        ModelName      "AOC 2590G4"
        HorizSync       160.0 - 160.0
        VertRefresh     30.0 - 146.0
        Option         "DPMS"
    EndSection
    
    Section "Device"
        Identifier     "Device0"
        Driver         "nvidia"
        VendorName     "NVIDIA Corporation"
        BoardName      "NVIDIA GeForce GTX 1060 6GB"
    EndSection
    
    Section "Screen"
        Identifier     "Screen0"
        Device         "Device0"
        Monitor        "Monitor0"
        DefaultDepth    24
        Option         "Stereo" "0"
        Option         "nvidiaXineramaInfoOrder" "DFP-3"
        Option         "metamodes" "DP-0: 1920x1080_144 +0+0 {ForceCompositionPipeline=On}"
        Option         "SLI" "Off"
        Option         "MultiGPU" "Off"
        Option         "BaseMosaic" "off"
        SubSection     "Display"
            Depth       24
        EndSubSection
    EndSection
  '';
}
