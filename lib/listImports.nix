# listImports :: path -> [path]
#
# Collect importable entries from a directory:
# - includes *.nix files except default.nix
# - includes subdirectories only if they contain default.nix
{ lib }:
dir:
let
  hasDefaultNix = d: builtins.pathExists (d + "/default.nix");
  childPath = name: dir + ("/" + name);

  entries = builtins.readDir dir;
  names = lib.attrNames entries;

  isNixFile = name: lib.hasSuffix ".nix" name && name != "default.nix";

  isImportableDir = name:
    entries.${name} == "directory" && hasDefaultNix (childPath name);

  wanted = builtins.filter (name: isNixFile name || isImportableDir name) names;
in
  builtins.map childPath wanted
