{ localLib, ... }@inputs:
let
  user = import (localLib.fromRoot "data/users/darwin.nix");
  platform = "darwin";
  system = "x86_64-darwin";
  darwin-modules = [ (localLib.fromRoot "system/darwin") ];
  home-modules = [ (localLib.fromRoot "home/darwin") ];
  specialArgs = inputs // {
    inherit user platform;
  };
  args = {
    inherit
      user
      system
      darwin-modules
      home-modules
      specialArgs
      ;
  };
in
localLib.darwinSystem args
