{ pkgs, localLib, ... }:
{
  # install initcache
  programs.fish.plugins = [ (localLib.mkPlugin pkgs.fishPlugins.initcache) ];
}
