{ localLib, ... }@inputs:
let
  platform = "wsl";
  system = "x86_64-linux";
  host = (import (localLib.fromRoot "data") platform) // { inherit platform; };
  nixos-modules = [ (localLib.fromRoot "system") ];
  home-modules = [ (localLib.fromRoot "home") ];
  specialArgs = inputs // {
    inherit host;
    pkgs-unstable = localLib.mkPkgs inputs.nixpkgs-unstable system;
  };
  args = {
    inherit
      host
      system
      nixos-modules
      home-modules
      specialArgs
      ;
  };
in
localLib.nixosSystem args
