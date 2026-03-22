{ data, lib, localLib, ... }:
{
  # Skip installation when using secrets (e.g., work environment)
  imports = lib.optionals (!(data.user.useSecrets or false)) (localLib.listImports ./.);
}
