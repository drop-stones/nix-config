{ pkgs, localLib, ... }:
{
  # wslwrap.fish: 🐟🐧 Auto-switch Linux/Windows executables in WSL2
  programs.fish.plugins = [ (localLib.mkPlugin pkgs.fishPlugins.wslwrap) ];
}
