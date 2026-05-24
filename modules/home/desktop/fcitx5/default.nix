{ host, localLib, ... }:
{
  imports = localLib.listImportsForPlatforms {
    platforms = [ "nixos" ];
    platform = host.platform;
    dir = ./.;
  };
}
