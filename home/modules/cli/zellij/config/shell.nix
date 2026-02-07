{ ... }:
{
  programs.zellij.extraConfig = ''
    default_shell "/run/current-system/sw/bin/fish"
  '';
}
