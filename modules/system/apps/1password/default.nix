{ host, localLib, ... }:
{
  imports = localLib.listImports {
    dir = ./.;
    inherit host;
    platforms = [ "nixos" "darwin" ];
  };
}
