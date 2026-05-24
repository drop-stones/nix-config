{ host, localLib, ... }:
{
  imports = localLib.listImports {
    platforms = [ "wsl" ];
    inherit host;
    dir = ./.;
  };
}
