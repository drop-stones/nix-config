{ pkgs, ... }:
{
  # clippy: Lints to improve your Rust code
  home.packages = [ pkgs.clippy ];
}
