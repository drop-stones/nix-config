# Noto fonts: Comprehensive Unicode coverage for fallback
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
  ];
}
