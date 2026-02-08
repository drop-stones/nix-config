{ pkgs, localLib, ... }:
{
  xdg.configFile."zellij/config.kdl".source = localLib.concatConfig {
    inherit pkgs;
    dir = ./.;
    ext = "kdl";
    outName = "zellij-config.kdl";
  };
}
