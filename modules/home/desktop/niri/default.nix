{ host, localLib, ... }:
{
  imports = localLib.listImports {
    platforms = [ "nixos" ];
    inherit host;
    dir = ./.;
  };
}
