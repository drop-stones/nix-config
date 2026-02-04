{ pkgs, ... }:
{
  # rustfmt: Format Rust code
  home.packages = [ pkgs.rustfmt ];
}
