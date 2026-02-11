{ pkgs, ... }:
{
  # Language server that offers Lua language support
  home.packages = [ pkgs.lua-language-server ];
}
