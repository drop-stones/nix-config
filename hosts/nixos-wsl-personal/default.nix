{ nixos-wsl, home-manager, ... }:

{
  imports = [
    ../../system/platforms/base

    nixos-wsl.nixosModules.default
    {
      wsl.enable = true;
      wsl.defaultUser = "drop-stones";
      system.stateVersion = "25.05";
    }

    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.drop-stones = {
        imports = [
          ./home.nix
        ];
      };
    }
  ];
}
