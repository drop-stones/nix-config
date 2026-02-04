{ pkgs, ... }:
{
  # rustc: A Rust compiler
  home.packages = [ pkgs.rustc ];
}
