# listPlatformImports :: { dir, platform, platforms? } -> [path]
#
# Collect importable entries from common/ and, if exists, from <platform>/ under a directory:
# - includes entries in common/ (via listImports)
# - includes entries in <platform>/ (via listImports) only if <platform>/ exists
# - if platforms is provided, returns [] unless platform is in the list (gate)
{ lib, ... }:
{
  dir,
  platform ? null,
  platforms ? null,
}:
let
  commonPath = lib.path.append dir "common";
  platformPath = if platform != null then lib.path.append dir platform else null;
  gated = platforms == null || lib.elem platform platforms;
in
lib.optionals gated (
  (lib.optional (builtins.pathExists commonPath) commonPath)
  ++ (lib.optional (platformPath != null && builtins.pathExists platformPath) platformPath)
)
