{ pkgs-unstable, ... }:
{
  programs.dank-material-shell = {
    enableSystemMonitoring = true;
    dgop.package = pkgs-unstable.dgop;
  };
}
