# listImports :: { dir, host?, platforms? } -> [path]
#
# Collect importable entries from a directory:
# - includes *.nix files except default.nix
# - includes subdirectories that contain default.nix
# - when host is given, subdirectories named like a known platform
#   (nixos, darwin, wsl) are kept only if they match host.platform;
#   non-matching platform dirs are skipped
# - when platforms is given, returns [] unless host.platform is in the list
{ lib, ... }:
let
  knownPlatforms = [
    "nixos"
    "darwin"
    "wsl"
  ];
in
{
  dir,
  host ? null,
  platforms ? null,
}:
let
  hasDefaultNix = d: builtins.pathExists (d + "/default.nix");
  childPath = name: dir + ("/" + name);
  isNixFile = name: lib.strings.hasSuffix ".nix" name && name != "default.nix";

  entries = builtins.readDir dir;
  names = builtins.attrNames entries;

  isImportableDir = name: entries.${name} == "directory" && hasDefaultNix (childPath name);
  isImportable = name: isNixFile name || isImportableDir name;

  matchesPlatformConvention =
    name: host == null || !(lib.elem name knownPlatforms) || name == host.platform;

  gated = platforms == null || (host != null && lib.elem host.platform platforms);

  wanted = builtins.filter (name: isImportable name && matchesPlatformConvention name) names;
in
lib.optionals gated (builtins.map childPath wanted)
