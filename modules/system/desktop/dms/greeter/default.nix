{
  localLib,
  host,
  dms,
  ...
}:
{
  imports = [
    dms.nixosModules.greeter
    (localLib.importModules ./. { inherit host; })
  ];
}
