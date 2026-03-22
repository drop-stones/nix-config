{ pkgs, ... }:
{
  # unzip: list, test and extract compressed files in a ZIP archive
  home.packages = with pkgs; [
    unzip
  ];
}
