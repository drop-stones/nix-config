{ pkgs, ... }:
let
  fishPlugin = plugin: { name = plugin.pname; src = plugin.src; };
in
{
  programs.fish = {
    enable = true;

    plugins = with pkgs.fishPlugins; (map fishPlugin [
      # public plugins
      autopair
      fzf-fish
      tide
      # local plugins
      betterescape
      initcache
    ]);
  };
}
