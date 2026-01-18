{ user, nixos-wsl, localLib, ... }:
{
  imports = [
    nixos-wsl.nixosModules.default
  ];

  wsl.enable = true;
  wsl.defaultUser = user.username;

  system.stateVersion = localLib.getInputVersionFromLock { name = "nixpkgs"; prefix = "nixos-"; };
}
