{
  description = "drop-stones' nix configuration for NixOS/macOS/WSL2";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs"; # same version with inputs.nixpkgs
    };

    # fish plugins
    betterescape-fish = {
      url = "github:drop-stones/betterescape.fish";
      flake = false;
    };
    initcache-fish = {
      url = "github:drop-stones/initcache.fish";
      flake = false;
    };
  };

  outputs = inputs:
  let
    localLib = import ./lib { lib = inputs.nixpkgs.lib; root = inputs.self.outPath; };
    args = inputs // { inherit localLib; };
  in
  {
    nixosConfigurations = {
      nixos-wsl = import ./hosts/nixos-wsl args;
    };
  };
}
