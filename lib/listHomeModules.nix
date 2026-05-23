# listHomeModules :: [String] -> [path]
#
# Create a list of paths under modules/home/ from a list of names:
# - ["foo" "bar"] → ["modules/home/foo" "modules/home/bar"]
args:
let
  fromRoot = import ./fromRoot.nix args;
in
names: map (name: fromRoot "modules/home/${name}") names
