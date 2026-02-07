# Collect fish plugins under ./pkgs/fishPlugins and return them as an attrset.
{ prev, localLib, ... }@args:
localLib.importDir {
  dir = ./.;
  mkValue = p: prev.callPackage p args;
}
