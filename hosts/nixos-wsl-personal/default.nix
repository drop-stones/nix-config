{ inputs, ... }:

{
  imports = [
    (inputs.self + "/hosts/nixos-wsl-personal/configuration.nix")

    inputs.nixos-wsl.nixosModules.default
    {
      wsl.enable = true;
      wsl.defaultUser = "drop-stones";
      system.stateVersion = "25.05";
    }

    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.drop-stones = import ./home.nix;
    }
  ];
}
