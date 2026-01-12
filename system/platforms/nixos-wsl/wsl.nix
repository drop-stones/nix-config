{ user, nixos-wsl, ... }:
{
  imports = [
    nixos-wsl.nixosModules.default
  ];

  wsl.enable = true;
  wsl.defaultUser = user.username;

  system.stateVersion = "25.05";
}
