# mkDarwinHost :: { inputs, hostDir, platform, system, hostOverrides? } -> darwinSystem
#
# Build a darwin-flavored host via nix-darwin's darwinSystem.
libInputs: args:
let
  prologue = import ./internal/hostPrologue.nix libInputs;
  darwinSystem = import ./internal/darwinSystem.nix libInputs;
  ctx = prologue args;
in
darwinSystem {
  inherit (ctx) host system specialArgs;
  darwin-modules = [ ctx.systemModule ] ++ ctx.hostExtras;
  home-modules = [ ctx.homeModule ];
}
