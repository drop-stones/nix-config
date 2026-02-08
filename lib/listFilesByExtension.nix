# listFilesByExtension :: { dir, ext ? null } -> [path]
# Return files under `dir`:
# - If ext is null or "", return files without an extension (no '.' in the name).
# - Otherwise, return files whose names end with ".${ext}".
# The result is sorted by file name.
{ lib, ... }:
{
  dir,
  ext ? null,
}:
let
  entries = builtins.readDir dir; # attrset: name -> "regular"|"directory"|...
  names = builtins.attrNames entries;

  isRegular = name: entries.${name} == "regular";
  hasNoExtension = name: lib.strings.match "^[^.]+$" name != null;

  matchesExt = name: isRegular name && lib.hasSuffix ".${ext}" name;
  matchesNoExt = name: isRegular name && hasNoExtension name;

  matches =
    if ext == null || ext == "" then
      builtins.filter matchesNoExt names
    else
      builtins.filter matchesExt names;
in
map (name: lib.path.append dir name) matches
