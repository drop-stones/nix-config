# darwinSystem :: {
#   data: { user: { username: string, useSecrets: bool?, ... }, ... },
#   system: string,
#   darwin-modules: [ module ],
#   home-modules: [ module ],
#   specialArgs: attrs,
# } -> darwinSystem
#
# Build a darwin system configuration and integrate Home Manager:
# - appends home-manager.darwinModules.home-manager to the darwin module list
# - conditionally loads secrets/ when data.user.useSecrets is true
# - reuses the same pkgs set between darwin and Home Manager
# - forwards specialArgs to Home Manager via extraSpecialArgs
# - imports the given Home Manager modules for the specified user
{
  lib,
  home-manager,
  nix-darwin,
  ...
}@args:
let
  fromRoot = import ./fromRoot.nix args;
in
{
  data,
  system,
  darwin-modules,
  home-modules,
  specialArgs,
  ...
}:
nix-darwin.lib.darwinSystem {
  inherit system specialArgs;

  modules =
    darwin-modules
    ++ lib.optionals (data.user.useSecrets or false) [ (fromRoot "secrets") ]
    ++ [
      home-manager.darwinModules.home-manager
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
