# mkNixosHost :: { inputs, hostDir, platform, system, hostOverrides? } -> nixosSystem
#
# Build a NixOS-flavored host (used for both `nixos` and `wsl` platforms,
# since both run on NixOS via lib.nixosSystem).
libInputs: args:
let
  mkHostContext = import ./internal/mkHostContext.nix libInputs;
  mkNixosSystem = import ./internal/mkNixosSystem.nix libInputs;
  ctx = mkHostContext args;
in
mkNixosSystem {
  inherit (ctx) host system specialArgs;
  systemModules = [ ctx.systemModule ] ++ ctx.hostExtras;
  homeModules = [ ctx.homeModule ];
}
