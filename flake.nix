{
  description = "Unified macOS and NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { self, nixpkgs, nix-darwin, nix-homebrew, home-manager }:
    {
      # macOS Configuration
      darwinConfigurations.mac = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs self; };
        modules = [
          # Host-specific config
          ./hosts/mac

          # Shared modules
          ./modules/shared/common.nix
          ./modules/shared/packages.nix

          # Darwin-specific modules
          ./modules/darwin

          # Homebrew integration
          nix-homebrew.darwinModules.nix-homebrew
          ./modules/darwin/homebrew.nix

          # Home Manager
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.bells = import ./modules/shared/home.nix;
          }
        ];
      };

      # NixOS Configuration
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = { inherit inputs self; };
        modules = [
          # Host-specific config
          ./hosts/nixos

          # Shared modules
          ./modules/shared/common.nix
          ./modules/shared/packages.nix

          # NixOS-specific modules
          ./modules/nixos

          # Home Manager
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.bells = import ./modules/shared/home.nix;
          }
        ];
      };
    };
}
