{ localLib, ... }@inputs:
localLib.mkNixosHost {
  inherit inputs;
  hostDir = ./.;
  platform = "wsl";
  system = "x86_64-linux";
  hostOverrides =
    base:
    base
    // {
      user = base.user // {
        username = "work";
        homeDirectory = "/home/work";
        profile = "work";
      };
      git = {
        enable = false;
      };
    };
}
