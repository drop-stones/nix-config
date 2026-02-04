# listImports :: path -> [path]
#
# Collect importable entries from a directory:
# - includes *.nix files except default.nix
# - includes subdirectories only if they contain default.nix
{ lib, ... }:
dir:
let
  # Utility functions
  hasDefaultNix = d: builtins.pathExists (d + "/default.nix");
  childPath = name: dir + ("/" + name);
  isNixFile = name: lib.strings.hasSuffix ".nix" name && name != "default.nix";

  entries = builtins.readDir dir;
  names = builtins.attrNames entries;

  isImportableDir = name: entries.${name} == "directory" && hasDefaultNix (childPath name);

  wanted = builtins.filter (name: isNixFile name || isImportableDir name) names;
in
builtins.map childPath wanted
