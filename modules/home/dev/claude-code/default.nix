{ host, lib, localLib, ... }:
{
  # Skip installation when using secrets (e.g., work environment)
  imports = lib.optionals (!(host.user.useSecrets or false)) (localLib.listImports ./.);
}
