{ host, localLib, ... }:
{
  imports = localLib.listImports {
    inherit host;
    dir = ./.;
  };
}
