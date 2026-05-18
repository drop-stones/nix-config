# genXdgConfigFileLinks :: { name :: String, path :: Path } -> AttrSet
#
# Recursively walks `path` and produces an attribute set suitable for
# xdg.configFile, where every leaf file becomes its own entry. Intermediate
# directories are therefore materialized as real directories by home-manager,
# allowing other modules (e.g. agenix) to drop additional files into the same
# tree without colliding with a directory-level symlink to the read-only nix
# store.
{ lib, ... }:
{ name, path }:
let
  go =
    relName: absPath:
    lib.concatMapAttrs (
      entry: type:
      let
        entryPath = absPath + "/${entry}";
        entryName = "${relName}/${entry}";
      in
      if type == "directory" then
        go entryName entryPath
      else
        { ${entryName} = { source = entryPath; }; }
    ) (builtins.readDir absPath);
in
go name path
