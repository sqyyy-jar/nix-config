{
  modulesPath,
  pkgs,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" "sr_mod" ];
    initrd.kernelModules = [ ];

    kernelModules = [ "kvm-intel" ];
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

  hardware.cpu.intel.updateMicrocode = true;

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/fa9da6e8-3309-4358-9ce2-a7df94d271aa";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/AC8F-1F13";
      fsType = "vfat";
    };

  swapDevices = [ ];

  networking.hostName = "nixos-desktop";
}
