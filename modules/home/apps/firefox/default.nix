{ platform, localLib, ... }:
{
  imports = localLib.listImportsForPlatforms {
    platforms = [ "nixos" "darwin" ];
    inherit platform;
    dir = ./.;
  };
}
