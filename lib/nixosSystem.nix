# nixosSystem :: {
#   nixpkgs: <flake input>,
#   home-manager: <flake input>,
#   user: { username: string, ... },
#   system: string,
#   nixos-modules: [ module ],
#   home-modules: [ module ],
#   specialArgs: attrs,
# } -> nixosSystem
#
# Build a NixOS system configuration and integrate Home Manager:
# - appends home-manager.nixosModules.home-manager to the NixOS module list
# - reuses the same pkgs set between NixOS and Home Manager
# - forwards specialArgs to Home Manager via extraSpecialArgs
# - imports the given Home Manager modules for the specified user
{ lib, home-manager, ... }:
{ user, system, nixos-modules, home-modules, specialArgs, ... }:
lib.nixosSystem {
  inherit system specialArgs;

  modules =
    nixos-modules
    ++ [
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;

        home-manager.extraSpecialArgs = specialArgs;

        home-manager.users.${user.username}.imports = home-modules;
      }
    ];
}
