{ pkgs-unstable, ... }:
{
  # zellij: A terminal workspace with batteries included
  programs.zellij = {
    enable = true;
    package = pkgs-unstable.zellij;
  };
}
