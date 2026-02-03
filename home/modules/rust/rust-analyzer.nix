{ pkgs, ... }:
{
  # rust-analyzer: A Rust compiler front-end for IDEs
  home.packages = [ pkgs.rust-analyzer ];
}
