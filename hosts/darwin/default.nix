{ localLib, ... }@inputs:
localLib.mkDarwinHost {
  inherit inputs;
  hostDir = ./.;
  platform = "darwin";
  system = "x86_64-darwin";
}
