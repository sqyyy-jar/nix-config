{
  description = "Personal NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... } @ inputs: let
    inherit (self) outputs;

    forEachSystem = nixpkgs.lib.genAttrs [
      "x86_64-linux"
    ];

    forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});
  in {
    packages = forEachPkgs (pkgs: (import ./pkgs {inherit pkgs;}));

    # devShells = forEachPkgs (pkgs: import ./shell.nix {inherit pkgs;});

    overlays = import ./overlays {inherit inputs outputs;};

    nixosConfigurations = import ./hosts {inherit inputs outputs;};
  };
}
