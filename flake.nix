{
  description = "drop-stones' flake for NixOS/Mac/WSL2";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/release-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs"; # same version with inputs.nixpkgs
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixos-wsl,
    home-manager,
    ...
  } @ inputs: {
    # The host with the hostname `nixos-wsl` will use this configuration
    nixosConfigurations.nixos-wsl = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
          home-manager.users.drop-stones = import ./home.nix;
	}

        nixos-wsl.nixosModules.default
        {
          system.stateVersion = "25.05";
          wsl.enable = true;
	  wsl.defaultUser = "drop-stones";
        }
      ];
    };
  };
}
