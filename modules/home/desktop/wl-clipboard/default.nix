{ localLib, host, ... }:
localLib.importsModule ./. {
  inherit host;
  platforms = [ "wsl" ];
}
