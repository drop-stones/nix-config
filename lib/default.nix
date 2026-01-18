{ lib, root } @ args:
{
  nixosSystem = import ./nixosSystem.nix;

  fromRoot = import ./fromRoot.nix args;
  listImports = import ./listImports.nix args;
}
