{ pkgs, ... }:
{
  # python: The Python programming language
  home.packages = with pkgs; [
    python3
  ];
}
