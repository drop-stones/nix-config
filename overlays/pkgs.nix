{ lib, localLib, ... }@args:
_final: prev:
let
  localPkgs = import (localLib.fromRoot "pkgs") (args // { inherit prev; });
in
lib.recursiveUpdate prev localPkgs
