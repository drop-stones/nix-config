{ localLib, ... }@inputs:
let
  platform = "nixos-wsl";
  system = "x86_64-linux";
  data = import (localLib.fromRoot "data") "work";
  nixos-modules = [
    (localLib.fromRoot "system/nixos-wsl")
    (localLib.fromRoot "secrets")
  ];
  home-modules = [ (localLib.fromRoot "home/nixos-wsl") ];
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
