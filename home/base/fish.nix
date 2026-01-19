{ pkgs, ... }:
let
  fishPlugin = plugin: { name = plugin.pname; src = plugin.src; };
in
{
  programs.fish = {
    enable = true;

    plugins = with pkgs.fishPlugins; (map fishPlugin [
      tide
      fzf-fish
      betterescape
    ]);
  };
}
