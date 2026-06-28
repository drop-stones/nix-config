# mkDarwinHost :: { inputs, hostDir, platform, system, hostOverrides? } -> darwinSystem
#
# Build a darwin-flavored host via nix-darwin's darwinSystem.
libInputs: args:
let
  mkHostContext = import ./internal/mkHostContext.nix libInputs;
  mkDarwinSystem = import ./internal/mkDarwinSystem.nix libInputs;
  ctx = mkHostContext args;
in
mkDarwinSystem {
  inherit (ctx) host system specialArgs;
  systemModules = [ ctx.systemModule ] ++ ctx.hostExtras;
  homeModules = [ ctx.homeModule ];
}
