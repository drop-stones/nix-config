{ nixpkgs, nixos-wsl, home-manager, ... }:
let
  user = import ../../data/users/drop-stones.nix;
  hostPath = ./.;
in
nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = {
    inherit nixos-wsl home-manager;
    inherit user;
    inherit hostPath;
  };
  modules = [
    ../../system/platforms/nixos-wsl
  ];
}
