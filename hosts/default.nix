{
  inputs,
  outputs,
  ...
}: let
  inherit (builtins) length;
  inherit (inputs.nixpkgs.lib) optionals;
  inherit (outputs) overlays;

  ## Core modules which are crucial for every system go here.
  ## These will be present on every NixOS machine by default.
  coreModules = [
    ../modules/core

    inputs.home-manager.nixosModules.default
  ];

  ## Defines a home-manager module for the `sqyyy` user.
  makeHome = modules: system: {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = {
        inherit inputs outputs;
      };

      users.sqyyy = {...}: {
        imports = modules;
        home.stateVersion = "23.05";
      };
    };
  };

  ## Defines a new NixOS system.
  makeSystem = {
    system,
    modules,
    homeModules ? [],
  }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = inputs // {inherit system;};
      modules =
        [
          {
            # Globally configure nixpkgs so that we can get unfree
            # packages on both stable and unstable channels.
            nixpkgs = {
              hostPlatform = system;
              overlays = [
                inputs.rust-overlay.overlays.default

                overlays.unstable-unfree-packages
              ];
              config.allowUnfree = true;
            };

            # Globally install the `vix` automation utility.
            environment.systemPackages = [
              # outputs.packages.${system}.vix
            ];
          }
        ]
        ++ coreModules
        ++ modules
        ++ (optionals (length homeModules != 0) [(makeHome homeModules system)]);
    };
in {
  desktop = makeSystem {
    system = "x86_64-linux";
    modules = [
      ./desktop.nix

      ../modules/desktop/gnome.nix
      ../modules/hw/nvidia.nix
    ];
    homeModules = [
      ../home/wayland

      ../home/firefox.nix
      ../home/git.nix
      ../home/gpg.nix
      ../home/kitty.nix
      ../home/programs.nix
      ../home/vscode.nix
      ../home/zsh.nix
      ../home/neovim.nix

      inputs.nix-index-database.hmModules.nix-index
    ];
  };

  laptop = makeSystem {
    system = "x86_64-linux";
    modules = [
      ./laptop.nix

      ../modules/desktop/gnome.nix
    ];
    homeModules = [
      ../home/wayland

      ../home/firefox.nix
      ../home/git.nix
      ../home/gpg.nix
      ../home/kitty.nix
      ../home/programs.nix
      ../home/vscode.nix
      ../home/zsh.nix
      ../home/neovim.nix

      inputs.nix-index-database.hmModules.nix-index
    ];
  };
}
