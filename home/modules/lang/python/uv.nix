{ pkgs, ... }:
{
  # uv: Fast Python package installer and resolver
  home.packages = with pkgs; [
    uv
  ];
}
