{ lib, localLib, ... }@args:
final: prev:
let
  localPkgs = import (localLib.fromRoot "pkgs") (args // { inherit prev; });
in
lib.recursiveUpdate prev localPkgs
