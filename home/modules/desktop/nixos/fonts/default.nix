# Font configuration for NixOS desktop
{ localLib, ... }:
{
  imports = localLib.listImports ./.;
}
