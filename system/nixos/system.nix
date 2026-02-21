{ localLib, ... }:
{
  system.stateVersion = localLib.getInputVersionFromLock {
    name = "nixpkgs";
    prefix = "nixos-";
  };
}
