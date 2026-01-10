{
  description = "drop-stones' flake for NixOS/Mac/WSL2";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/release-25.05";
  };

  outputs = {
    self,
    nixpkgs,
    nixos-wsl,
    ...
  } @ inputs: {
    # The host with the hostname `nixos-wsl` will use this configuration
    nixosConfigurations.nixos-wsl = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        nixos-wsl.nixosModules.default
        {
          system.stateVersion = "25.05";
          wsl.enable = true;
        }
      ];
    };
  };
}
