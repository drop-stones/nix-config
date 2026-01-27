{ pkgs, ... }:
{
  # install tree-sitter
  home.packages = with pkgs; [
    tree-sitter
  ];
}
