# mkNixosHost :: { inputs, hostDir, platform, system, hostOverrides? } -> nixosSystem
#
# Build a NixOS-flavored host (used for both `nixos` and `wsl` platforms,
# since both run on NixOS via lib.nixosSystem).
{ ... }@libInputs:
args:
let
  prologue = import ./_hostPrologue.nix libInputs;
  nixosSystem = import ./nixosSystem.nix libInputs;
  ctx = prologue args;
in
nixosSystem {
  inherit (ctx) host system specialArgs;
  nixos-modules = [ ctx.systemModule ] ++ ctx.hostExtras;
  home-modules = [ ctx.homeModule ];
}
