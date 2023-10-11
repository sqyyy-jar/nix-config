{
  modulesPath,
  pkgs,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    kernelModules = [];
    extraModulePackages = [];

    loader = {
      efi.canTouchEfiVariables = true;
      # systemd-boot.enable = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        theme = pkgs.nixos-grub2-theme;
      };
    };

    supportedFilesystems = ["ntfs"];

    kernelPackages = pkgs.unstable.linuxPackages_latest;
  };

  hardware.cpu.amd.updateMicrocode = true;

  # fileSystems."/" = {
  #   device = "/dev/disk/by-uuid/42993a77-a622-4198-8798-7edf43e59107";
  #   fsType = "ext4";
  # };
  # fileSystems."/boot" = {
  #   device = "/dev/disk/by-uuid/CC89-57F0";
  #   fsType = "vfat";
  # };
  # fileSystems."/home" = {
  #   device = "/dev/disk/by-uuid/7edab4b6-ed9a-482a-8ab8-d9476342fea0";
  #   fsType = "ext4";
  # };
  #
  # swapDevices = [
  #   {device = "/dev/disk/by-uuid/a5acf252-9402-4724-970c-ba3dd5645402";}
  # ];

  networking = {
    hostName = "nixos-laptop";

    networkmanager = {
      enable = true;
      wifi.macAddress = "random";
      ethernet.macAddress = "random";
    };
  };
}

