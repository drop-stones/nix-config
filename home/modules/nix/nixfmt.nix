{ pkgs, ... }:
{
  # nixfmt: The official formatter for Nix code
  home.packages = [ pkgs.nixfmt ];
}
