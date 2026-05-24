{ host, localLib, ... }:
{
  imports = localLib.listImports {
    dir = ./.;
    inherit host;
  };
}
