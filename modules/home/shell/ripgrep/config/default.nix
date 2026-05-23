{ pkgs, localLib, ... }:
{
  xdg.configFile."ripgrep/config".source = localLib.concatConfig {
    inherit pkgs;
    dir = ./.;
    ext = "conf";
    outName = "ripgrep-config";
  };
}
