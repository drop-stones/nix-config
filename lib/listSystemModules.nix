# listSystemModules :: [String] -> [path]
#
# Create a list of paths under system/modules/ from a list of names:
# - ["foo" "bar"] → ["system/modules/foo" "system/modules/bar"]
args:
let
  fromRoot = import ./fromRoot.nix args;
in
names: map (name: fromRoot "system/modules/${name}") names
