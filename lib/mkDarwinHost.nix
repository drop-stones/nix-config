# mkDarwinHost :: { inputs, hostDir, platform, system, hostOverrides? } -> darwinSystem
#
# Build a darwin-flavored host via nix-darwin's darwinSystem.
libInputs: args:
let
  prologue = import ./_hostPrologue.nix libInputs;
  darwinSystem = import ./darwinSystem.nix libInputs;
  ctx = prologue args;
in
darwinSystem {
  inherit (ctx) host system specialArgs;
  darwin-modules = [ ctx.systemModule ] ++ ctx.hostExtras;
  home-modules = [ ctx.homeModule ];
}
