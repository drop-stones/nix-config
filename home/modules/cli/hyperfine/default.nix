{ pkgs, ... }:
{
  # hyperfine: A command-line benchmarking tool
  home.packages = [ pkgs.hyperfine ];
}
