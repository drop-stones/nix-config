{ pkgs, ... }:
{
  # nixfmt: The official formatter for Nix code
  home.packages = with pkgs; [
    nixfmt
    nixfmt-tree
  ];
}
