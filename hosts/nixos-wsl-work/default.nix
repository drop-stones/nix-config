{ localLib, ... }@inputs:
let
  user = import (localLib.fromRoot "data/users/work.nix");
  platform = "nixos-wsl";
  system = "x86_64-linux";
  nixos-modules = [ (localLib.fromRoot "system/nixos-wsl") ];
  home-modules = [ (localLib.fromRoot "home/nixos-wsl") ];
  specialArgs = inputs // {
    inherit user platform;
  };
  args = {
    inherit
      user
      system
      nixos-modules
      home-modules
      specialArgs
      ;
  };
in
localLib.nixosSystem args
