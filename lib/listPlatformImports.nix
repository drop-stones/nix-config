# listPlatformImports :: { dir, platform } -> [path]
#
# Collect importable entries from common/ and, if exists, from <platform>/ under a directory:
# - includes entries in common/ (via listImports)
# - includes entries in <platform>/ (via listImports) only if <platform>/ exists
{ lib, ... }:
{ dir, platform ? null }:
let
  commonPath = lib.path.append dir "common";
  platformPath = if platform != null then lib.path.append dir platform else null;
in
  (lib.optional (builtins.pathExists commonPath) commonPath)
  ++ (lib.optional (platformPath != null && builtins.pathExists platformPath) platformPath)
