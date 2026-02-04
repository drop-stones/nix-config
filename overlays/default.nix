# Return a list of overlay functions collected from this directory.
# Pass this file's arguments (e.g., localLib) to each imported overlay.
# Each imported entry must evaluate to: final: prev: { ... }
{ localLib, ... }@args: builtins.map (p: import p args) (localLib.listImports ./.)
