{
  description = "YAML with functions";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";  # Fixed assignment operator
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";  # Ensure this matches your architecture
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];  # Ensure this file exists
        };
      };
      homeConfigurations = {
        user = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;  # Take pkgs var from let binding
          modules = [ ./configuration.nix ];  # Ensure this file exists
        };
      };
    };
}

