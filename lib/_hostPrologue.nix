# _hostPrologue :: { inputs, hostDir, platform, system, hostOverrides? } -> ctx
#
# Internal helper shared by mkNixosHost and mkDarwinHost. Builds the
# host attribute, specialArgs, and the module path lists shared by all
# system builders. Not intended for direct use; the leading underscore
# is a privacy convention.
#
# `inputs` is the host file's args (flake inputs + localLib); it gets
# forwarded into specialArgs so modules can receive `localLib` and the
# raw flake inputs.
{ ... }@libInputs:
{
  inputs,
  hostDir,
  platform,
  system,
  hostOverrides ? (d: d),
}:
let
  fromRoot = import ./fromRoot.nix libInputs;
  listImports = import ./listImports.nix libInputs;
  mkPkgs = import ./mkPkgs.nix libInputs;

  baseData = import (fromRoot "data") platform;
  host = (hostOverrides baseData) // { inherit platform; };
in
{
  inherit host system;
  hostExtras = listImports { dir = hostDir; };
  specialArgs = inputs // {
    inherit host;
    pkgs-unstable = mkPkgs inputs.nixpkgs-unstable system;
  };
  systemModule = fromRoot "system";
  homeModule = fromRoot "home";
}
