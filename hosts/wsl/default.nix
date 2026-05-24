{ localLib, ... }@inputs:
localLib.mkNixosHost {
  inherit inputs;
  hostDir = ./.;
  platform = "wsl";
  system = "x86_64-linux";
}
