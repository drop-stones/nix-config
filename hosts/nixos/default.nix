{ localLib, ... }@inputs:
let
  platform = "nixos";
  system = "x86_64-linux";
  data = import (localLib.fromRoot "data") platform;
  nixos-modules = [
    (localLib.fromRoot "system/nixos")
    ./configuration.nix
    ./disko.nix
    ./hardware-configuration.nix
  ];
  home-modules = [ (localLib.fromRoot "home/nixos") ];
  specialArgs = inputs // {
    inherit data platform;

    # custom pkgs
    pkgs-unstable = import inputs.nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  };
  args = {
    inherit
      data
      system
      nixos-modules
      home-modules
      specialArgs
      ;
  };
in
localLib.nixosSystem args
