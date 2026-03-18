{ localLib, dms, ... }:
{
  imports = [
    dms.nixosModules.greeter
  ] ++ localLib.listImports ./.;
}
