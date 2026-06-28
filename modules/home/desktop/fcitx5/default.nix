{ localLib, host, ... }:
localLib.importsModule ./. {
  inherit host;
  platforms = [ "nixos" ];
}
