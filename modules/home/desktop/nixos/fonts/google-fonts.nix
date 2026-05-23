# Google Fonts: Includes BIZ UDGothic/UDMincho and many other fonts
# BIZ UD fonts are also available on Windows 10/11, providing consistency across platforms
{ pkgs, ... }:
{
  home.packages = [ pkgs.google-fonts ];
}
