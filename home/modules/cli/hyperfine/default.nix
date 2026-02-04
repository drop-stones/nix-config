{ pkgs, ... }:
{
  # install hyperfine
  home.packages = with pkgs; [
    hyperfine
  ];
}
