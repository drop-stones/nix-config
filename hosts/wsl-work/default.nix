{ localLib, ... }@inputs:
let
  platform = "wsl";
  system = "x86_64-linux";
  baseData = import (localLib.fromRoot "data") platform;
  data = baseData // {
    user = baseData.user // {
      username = "work";
      homeDirectory = "/home/work";
      useSecrets = true;
    };
    git = { enable = false; };
  };
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
