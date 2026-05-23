{ pkgs, localLib, ... }:
{
  # initcache: 🐟⚡ Cache Fish init for faster startup
  programs.fish.plugins = [ (localLib.mkPlugin pkgs.fishPlugins.initcache) ];
}
