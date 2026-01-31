# genXdgConfigFileLinks :: String -> Path -> AttrSet
#
# Returns an attribute set mapping each entry directly under the given directory
# (both files and directories) to a name.source pair suitable for xdg.configFile.
{ lib, ... }:
{ name, path }:
let
  entries = builtins.readDir path;
  names = builtins.attrNames entries;
in
builtins.listToAttrs (map (entry: {
  name = "${name}/${entry}";
  value = { source = path + "/" + entry; };
}) names)
