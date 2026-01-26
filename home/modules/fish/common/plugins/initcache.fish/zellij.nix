{ config, lib, ... }:
{
  # settings for zellij
  programs.fish.interactiveShellInit = ''
    ${lib.optionalString config.programs.zellij.enable "initcache source -- zellij setup --generate-auto-start fish"}
  '';

  # disable zellij integration if zellij is enabled
  programs.zellij.enableFishIntegration = if (config.programs.zellij.enable) then false else config.programs.zellij.enableFishIntegration;
}
