# Temporary: build zellij v0.44.0 with unstable toolchain
# Remove once nixpkgs-unstable ships v0.44.0
{ pkgs, pkgs-unstable, ... }:
let
  version = "0.44.0";
  src = pkgs.fetchFromGitHub {
    owner = "zellij-org";
    repo = "zellij";
    tag = "v${version}";
    hash = "sha256-9jVBz+in8TrdX5qYXdSBCN3SYhG/JJLIbkq0DC0tm4Q=";
  };
in
{
  programs.zellij = {
    enable = true;
    package = pkgs-unstable.zellij.overrideAttrs (old: {
      inherit version src;
      cargoDeps = pkgs-unstable.rustPlatform.fetchCargoVendor {
        inherit src;
        name = "zellij-${version}";
        hash = "sha256-nGMOVq5etxiOfocjTKXAd8sJHFw34T49Ga48Isc8dCg=";
      };
    });
  };
}
