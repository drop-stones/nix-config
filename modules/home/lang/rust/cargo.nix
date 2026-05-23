{ pkgs, ... }:
{
  # cargo: The Rust package manager
  home.packages = [ pkgs.cargo ];
}
