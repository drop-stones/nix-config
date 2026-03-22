# nixosSystem :: {
#   data: { user: { username: string, useSecrets: bool?, ... }, ... },
#   system: string,
#   nixos-modules: [ module ],
#   home-modules: [ module ],
#   specialArgs: attrs,
# } -> nixosSystem
#
# Build a NixOS system configuration and integrate Home Manager:
# - appends home-manager.nixosModules.home-manager to the NixOS module list
# - conditionally loads secrets/ when data.user.useSecrets is true
# - reuses the same pkgs set between NixOS and Home Manager
# - forwards specialArgs to Home Manager via extraSpecialArgs
# - imports the given Home Manager modules for the specified user
{ lib, home-manager, ... }@args:
let
  fromRoot = import ./fromRoot.nix args;
in
{
  data,
  system,
  nixos-modules,
  home-modules,
  specialArgs,
  ...
}:
lib.nixosSystem {
  inherit system specialArgs;

  modules =
    nixos-modules
    ++ lib.optionals (data.user.useSecrets or false) [ (fromRoot "secrets") ]
    ++ [
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = specialArgs;
          users.${data.user.username}.imports = home-modules;
        };
      }
    ];
}
