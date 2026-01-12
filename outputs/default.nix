{ self, nixpkgs, nixos-wsl, home-manager, ... } @ inputs:

{
  nixosConfigurations = {
    nixos-wsl-personal = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit nixos-wsl home-manager; };
      modules = [
        (import (self + "/hosts/nixos-wsl-personal"))
      ];
    };
  };
}
