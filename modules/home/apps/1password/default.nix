{ platform, localLib, ... }:
{
  imports = localLib.listImportsForPlatforms {
    platforms = [ "nixos" ];
    inherit platform;
    dir = ./.;
  };
}
