{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Wine: Windows compatibility layer for running .exe files
    wineWow64Packages.stable
  ];
}
