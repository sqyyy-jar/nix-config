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

    supportedFilesystems = [ "ntfs" ];

    kernelPackages = pkgs.unstable.linuxPackages_latest;
  };

  hardware.cpu.intel.updateMicrocode = true;

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/fa9da6e8-3309-4358-9ce2-a7df94d271aa";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/37D3-5983";
      fsType = "vfat";
    };

  fileSystems."/mnt/data" =
    { device = "/dev/disk/by-uuid/2ebfd504-1614-470f-a53d-2deeba59ba3b";
      fsType = "ext4";
    };

  swapDevices = [ {
    device = "/dev/disk/by-uuid/788bb1e6-be65-4414-823f-0eae6085d2c0";
  } ];

  networking.hostName = "nixos-desktop";
}
