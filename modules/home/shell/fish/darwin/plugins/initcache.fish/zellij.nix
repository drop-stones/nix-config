{ config, lib, ... }:
{
  # settings for zellij
  programs.fish.interactiveShellInit = ''
    ${lib.optionalString config.programs.zellij.enable "initcache source -- zellij setup --generate-auto-start fish"}
  '';
}
