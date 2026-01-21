# listHomeModules :: [String] -> [path]
#
# Create a list of paths under home/modules/ from a list of names:
# - ["foo" "bar"] → ["home/modules/foo" "home/modules/bar"]
{ ... } @ args:
let
  fromRoot = import ./fromRoot.nix args;
in
names: map (name: fromRoot "home/modules/${name}") names
