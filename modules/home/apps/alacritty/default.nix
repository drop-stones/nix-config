{ host, localLib, ... }:
{
  imports = localLib.listImports {
    platforms = [
      "nixos"
      "darwin"
    ];
    inherit host;
    dir = ./.;
  };
}
