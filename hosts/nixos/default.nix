{ localLib, ... }@inputs:
let
  platform = "nixos";
  system = "x86_64-linux";
  data = import (localLib.fromRoot "data") platform;
  nixos-modules = [
    (localLib.fromRoot "system/nixos")
    ./disko.nix
  ];
  home-modules = [ (localLib.fromRoot "home/nixos") ];
  specialArgs = inputs // {
    inherit data platform system;
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
