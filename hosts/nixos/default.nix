{ localLib, ... }@inputs:
localLib.mkNixosHost {
  inherit inputs;
  hostDir = ./.;
  platform = "nixos";
  system = "x86_64-linux";
}
