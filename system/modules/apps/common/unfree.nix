{ lib, ... }:
{
  # Enable the unfree packages
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "1password"
      "1password-cli"
    ];
}
