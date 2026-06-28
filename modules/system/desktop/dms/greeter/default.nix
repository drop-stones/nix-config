{
  localLib,
  host,
  dms,
  ...
}:
{
  imports = [
    dms.nixosModules.greeter
    (localLib.importsModule ./. { inherit host; })
  ];
}
