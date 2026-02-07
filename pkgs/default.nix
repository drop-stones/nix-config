# Collect custom packages under ./pkgs and return them as an attrset.
# Supported layouts:
# - pkgs/foo.nix         -> pkgs.foo
# - pkgs/foo/default.nix -> pkgs.foo
{ prev, localLib, ... }@args:
localLib.importDir {
  dir = ./.;
  mkValue = p: prev.callPackage p args;
}
