{ pkgs, ... }:
{
  # tree-sitter: An incremental parsing system for programming tools
  home.packages = with pkgs; [
    tree-sitter
  ];
}
