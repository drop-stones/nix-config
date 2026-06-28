# mkPkgs :: nixpkgs -> string -> pkgs
#
# Import a nixpkgs flake input for the given system with allowUnfree enabled.
_: nixpkgs: system:
import nixpkgs {
  inherit system;
  config.allowUnfree = true;
}
