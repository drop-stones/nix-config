{ pkgs, ... }:
{
  # statix: lints and suggestions for the nix programming language
  home.packages = [ pkgs.statix ];
}
