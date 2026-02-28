{ pkgs, localLib, ... }:
{
  xdg.configFile."tridactyl/tridactylrc".source = localLib.concatConfig {
    inherit pkgs;
    dir = ./.;
    ext = "vim";
    outName = "tridactylrc";
  };
}
