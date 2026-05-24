{ localLib, ... }@inputs:
let
  platform = "darwin";
  system = "x86_64-darwin";
  host = (import (localLib.fromRoot "data") platform) // { inherit platform; };
  darwin-modules = [ (localLib.fromRoot "system") ];
  home-modules = [ (localLib.fromRoot "home") ];
  specialArgs = inputs // {
    inherit host;
    pkgs-unstable = localLib.mkPkgs inputs.nixpkgs-unstable system;
  };
  args = {
    inherit
      host
      system
      darwin-modules
      home-modules
      specialArgs
      ;
  };
in
localLib.darwinSystem args
