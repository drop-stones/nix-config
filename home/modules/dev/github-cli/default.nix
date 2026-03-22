{ pkgs, ... }:
{
  # GitHub CLI: GitHub's official command line tool
  home.packages = [ pkgs.gh ];
}
