{ pkgs, localLib, ... }:
{
  xdg.configFile."niri/config.kdl".source = localLib.concatConfig {
    inherit pkgs;
    dir = ./.;
    ext = "kdl";
    outName = "niri-config.kdl";
  };
}
