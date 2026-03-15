{ localLib, ... }@inputs:
let
  platform = "darwin";
  system = "x86_64-darwin";
  data = import (localLib.fromRoot "data") platform;
  darwin-modules = [ (localLib.fromRoot "system/darwin") ];
  home-modules = [ (localLib.fromRoot "home/darwin") ];
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
      darwin-modules
      home-modules
      specialArgs
      ;
  };
in
localLib.darwinSystem args
