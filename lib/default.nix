{ lib, root } @ args:
{
  nixosSystem = import ./nixosSystem.nix;

  fromRoot = import ./fromRoot.nix args;
  pathToStem = import ./pathToStem.nix args;
  listImports = import ./listImports.nix args;
}
