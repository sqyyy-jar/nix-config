{
  modulesPath,
  pkgs,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
    initrd.kernelModules = [ ];

    kernelModules = [ "kvm-amd" ];
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

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/7f371914-c8f3-489a-8ce7-f1bbeddeb638";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/2AA9-A98A";
      fsType = "vfat";
    };

  swapDevices = [ ];

  networking.hostName = "nixos-laptop";
}

