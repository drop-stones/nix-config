# concatConfig :: { dir, ext, outName, separator ? "\n\n" } -> path
# Create a store file containing the concatenated config.
{ lib, ... }@args:
let
  listFilesByExtension = import ./listFilesByExtension.nix args;
in
{
  pkgs,
  dir,
  ext ? null,
  outName,
  separator ? "\n\n",
}:
pkgs.writeText outName (
  lib.concatStringsSep separator (
    map builtins.readFile (listFilesByExtension {
      inherit dir ext;
    })
  )
)
