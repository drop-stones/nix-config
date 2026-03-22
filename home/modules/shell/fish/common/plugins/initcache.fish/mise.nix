{ config, lib, ... }:
{
  # settings for mise
  programs.fish.interactiveShellInit = ''
    ${lib.optionalString config.programs.mise.enable "initcache source mise activate fish"}
  '';

  # disable mise integration if mise is enabled
  programs.mise.enableFishIntegration =
    if (config.programs.mise.enable) then false else config.programs.mise.enableFishIntegration;
}
