{ localLib, host, ... }:
localLib.importModules ./. {
  inherit host;
  platforms = [
    "nixos"
    "darwin"
  ];
}
