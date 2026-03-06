{ pkgs, localLib, ... }:
{
  programs.tmux.extraConfig = builtins.readFile (localLib.concatConfig {
    inherit pkgs;
    dir = ./.;
    ext = "conf";
    outName = "tmux-extra-config";
  });
}
