{ pkgs, dgop, ... }:
{
  # dgop: Dank GO Process Status (setup manually only for nixos-25.11)
  programs.dank-material-shell = {
    enableSystemMonitoring = true;
    dgop.package = dgop.packages.${pkgs.system}.default;
  };
}
