# listImportsForPlatforms :: { platforms, platform, dir } -> [path]
#
# Gate-and-collect helper for platform-restricted modules:
# - returns listImports dir when current platform is in the platforms list
# - returns [] otherwise (so the module is silently skipped)
{ lib, ... }@args:
let
  listImports = import ./listImports.nix args;
in
{
  platforms,
  platform,
  dir,
}:
lib.optionals (lib.elem platform platforms) (listImports dir)
