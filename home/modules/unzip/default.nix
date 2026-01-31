{ pkgs, ... }:
{
  # install unzip
  home.packages = with pkgs; [
    unzip
  ];
}
