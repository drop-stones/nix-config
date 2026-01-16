{ self, nixpkgs, nixos-wsl, home-manager, localLib, ... } @ inputs:
let
  user = import (localLib.fromRoot "data/users/drop-stones.nix");
  system = "x86_64-linux";
  nixos-modules = [ (localLib.fromRoot "system/nixos-wsl") ];
  home-modules = [ (localLib.fromRoot "home/nixos-wsl") ];
  specialArgs = inputs // { inherit user; };
  args = inputs // { inherit user system nixos-modules home-modules specialArgs; };
in
localLib.nixosSystem args
