# importDir :: { dir, mkValue ? (p: import p) } -> attrs
#
# Convert importable entries in `dir` to an attrset:
# - ./foo.nix          -> { foo = mkValue ./foo.nix; }
# - ./bar/default.nix  -> { bar = mkValue ./bar; }
args:
{
  dir,
  mkValue ? import,
}:
let
  pathToStem = import ./internal/pathToStem.nix args;
  listImports = import ./internal/listImports.nix args;

  paths = listImports { inherit dir; };
in
builtins.listToAttrs (
  map (p: {
    name = pathToStem p;
    value = mkValue p;
  }) paths
)
