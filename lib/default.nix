args:
let
  importDir = import ./importDir.nix args;
in
importDir {
  dir = ./.;
  mkValue = p: import p args;
}
