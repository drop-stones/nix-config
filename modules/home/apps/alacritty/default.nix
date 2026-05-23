{ host, localLib, ... }:
{
  imports = localLib.listImportsForPlatforms {
    platforms = [ "nixos" "darwin" ];
    platform = host.platform;
    dir = ./.;
  };
}
