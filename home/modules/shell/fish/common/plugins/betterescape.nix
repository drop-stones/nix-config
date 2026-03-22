{ pkgs, localLib, ... }:
{
  programs.fish = {
    # betterescape.fish: 🐟⎋ Vi-mode escape sequences for fish shell
    plugins = [ (localLib.mkPlugin pkgs.fishPlugins.betterescape) ];

    # settings
    interactiveShellInit = ''
      set -g betterescape_sequence jk
      set -g betterescape_timeout 150 # ms
    '';
  };
}
