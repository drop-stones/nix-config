# mkPlugin :: pkg -> { name, src }
#
# Convert a Nix package (derivation) to a plugin-compatible attribute set:
# - extracts 'name' from 'pname'
# - extracts 'src' from 'src'
#
# Commonly used for fish, vim, zsh, and other plugin system derivations.
{ ... }:
package: { name = package.pname; src = package.src; }
