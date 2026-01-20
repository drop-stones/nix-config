{ pkgs, localLib, ... }:
{
  programs.fish.plugins = [ (localLib.mkPlugin pkgs.fishPlugins.betterescape) ];
}
