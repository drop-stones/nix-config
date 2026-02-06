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

    # secrets management
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # private secrets
    secrets-config = {
      url = "git+ssh://git@github.com/drop-stones/secrets-config";
      flake = false;
    };

    # nvim-config
    nvim-config = {
      url = "github:drop-stones/nvim-config";
      flake = false;
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
    wslwrap-fish = {
      url = "github:drop-stones/wslwrap.fish";
      flake = false;
    };
  };

  outputs =
    inputs:
    let
      localLib = import ./lib (
        inputs
        // {
          inherit (inputs.nixpkgs) lib;
          root = inputs.self.outPath;
        }
      );
      args = inputs // {
        inherit localLib;
      };
    in
    {
      nixosConfigurations = {
        nixos-wsl = import ./hosts/nixos-wsl args;
        nixos-wsl-work = import ./hosts/nixos-wsl-work args;
      };
    };
}
