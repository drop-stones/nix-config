# pathToStem :: path -> string
#
# Get the filename stem from a path by removing the last extension.
# Examples:
# - ./foo.nix     -> "foo"
# - ./foo.tar.gz  -> "foo.tar"
# - ./foo         -> "foo"
# - ./foo/        -> "foo"
{ lib, ... }:
path:
let
  base = builtins.baseNameOf (toString path);
  parts = lib.strings.splitString "." base;
  stemParts =
    if builtins.length parts <= 1
    then parts
    else lib.lists.init parts;
in
lib.strings.concatStringsSep "." stemParts
