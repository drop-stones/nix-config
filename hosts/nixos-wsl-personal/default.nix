{ self, nixpkgs, nixos-wsl, home-manager, localLib, ... } @ inputs:
let
  user = import (localLib.fromRoot "data/users/drop-stones.nix");
  system = "x86_64-linux";
  nixos-modules = [ (localLib.fromRoot "system/platforms/nixos-wsl") ];
  home-modules = [ ./home.nix ];
  specialArgs = inputs // { inherit user; };
  args = inputs // { inherit user system nixos-modules home-modules specialArgs; };
in
localLib.nixosSystem args
