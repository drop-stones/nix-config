{ dms, ... }:
{
  # Dank Linux: Desktop shell for wayland compositors
  imports = [ dms.homeModules.dank-material-shell ];

  programs.dank-material-shell.enable = true;
}
