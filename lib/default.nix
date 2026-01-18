{ lib, root } @ args:
{
  nixosSystem = import ./nixosSystem.nix;
  getInputVersionFromLock = import ./getInputVersionFromLock.nix args;

  fromRoot = import ./fromRoot.nix args;
  pathToStem = import ./pathToStem.nix args;
  listImports = import ./listImports.nix args;
  importDir = import ./importDir.nix args;
}
