# listSystemModules :: [String] -> [path]
#
# Create a list of paths under modules/system/ from a list of names:
# - ["foo" "bar"] → ["modules/system/foo" "modules/system/bar"]
args:
let
  fromRoot = import ./fromRoot.nix args;
in
names: map (name: fromRoot "modules/system/${name}") names
