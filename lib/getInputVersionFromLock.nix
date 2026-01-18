# getInputVersionFromLock :: { name, removePrefix ? null } -> string
#
# Read flake.lock and derive a version-like string for the given input.
#
# Rules:
# - Get nodes.<name>.original.ref.
# - If prefix is set and the ref starts with it, drop that prefix.
# - Otherwise return the remaining string as-is.
{ lib, ... } @ args:
{ name, prefix ? null }:
let
  lockPath = (import ./fromRoot.nix args) "flake.lock";
  lock = builtins.fromJSON (builtins.readFile lockPath);

  node = lock.nodes.${name} or (builtins.throw "getInputVersionFromLock: input not found in flake.lock: ${name}");
  ref =
    if node ? original && node.original ? ref then node.original.ref
    else builtins.throw "getInputVersionFromLock: original.ref not found for input: ${name}";
in
  if prefix == null
  then ref
  else lib.strings.removePrefix prefix ref
