{ host, localLib, ... }:
{
  imports = localLib.listPlatformImports {
    dir = ./.;
    platform = host.platform;
    platforms = [ "nixos" "darwin" ];
  };
}
