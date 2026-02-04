{ pkgs, localLib, ... }:
{
  programs.fish = {
    # install betterescape.fish
    plugins = [ (localLib.mkPlugin pkgs.fishPlugins.betterescape) ];

    # settings
    interactiveShellInit = ''
      set -g betterescape_sequence jk
      set -g betterescape_timeout 150 # ms
    '';
  };
}
