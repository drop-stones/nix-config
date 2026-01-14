{ lib, root }:
{
  nixosSystem = import ./nixosSystem.nix;

  fromRoot = import ./fromRoot.nix { inherit lib root; };
  listImports = import ./listImports.nix { inherit lib; };
}
