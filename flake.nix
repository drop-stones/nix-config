{
  description = "drop-stones' nix configuration for NixOS/macOS/WSL2";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/release-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs"; # same version with inputs.nixpkgs
    };
  };

  outputs = inputs:
  let
    localLib = import ./lib { lib = inputs.nixpkgs.lib; root = inputs.self.outPath; };
    args = inputs // { inherit localLib; };
  in
  {
    nixosConfigurations = {
      nixos-wsl-personal = import ./hosts/nixos-wsl-personal args;
    };
  };
}
