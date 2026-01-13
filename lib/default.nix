{ lib }:
{
  nixosSystem = import ./nixosSystem.nix;

  listImports = import ./listImports.nix { inherit lib; };
}
