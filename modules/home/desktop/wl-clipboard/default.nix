{ host, localLib, ... }:
{
  imports = localLib.listImportsForPlatforms {
    platforms = [ "wsl" ];
    platform = host.platform;
    dir = ./.;
  };
}
