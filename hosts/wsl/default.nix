{ localLib, ... }@inputs:
let
  platform = "wsl";
  system = "x86_64-linux";
  data = import (localLib.fromRoot "data") platform;
  host = data // { inherit platform; };
  nixos-modules = [ (localLib.fromRoot "system/wsl") ];
  home-modules = [ (localLib.fromRoot "home/wsl") ];
  specialArgs = inputs // {
    inherit data host platform;
    pkgs-unstable = localLib.mkPkgs inputs.nixpkgs-unstable system;
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
