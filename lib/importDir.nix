# importDir :: { dir, mkValue ? (p: import p) } -> attrs
#
# Convert importable entries in `dir` to an attrset:
# - ./foo.nix          -> { foo = mkValue ./foo.nix; }
# - ./bar/default.nix  -> { bar = mkValue ./bar; }
{ lib, ... } @ args:
{ dir, mkValue ? (p: import p) }:
let
  pathToStem = import ./pathToStem.nix args;
  listImports = import ./listImports.nix args;

  paths = listImports dir;
in
builtins.listToAttrs (map (p: {
  name = pathToStem p;
  value = mkValue p;
}) paths)
