{ platform, localLib, ... }:
{
  imports = localLib.listPlatformImports {
    dir = ./.;
    inherit platform;
  };
}
