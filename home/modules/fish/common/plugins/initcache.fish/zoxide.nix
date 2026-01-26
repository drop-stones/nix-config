{ config, lib, ... }:
{
  # settings for zoxide
  programs.fish.interactiveShellInit = ''
    ${lib.optionalString config.programs.zoxide.enable "initcache source zoxide init fish"}
  '';

  # disable zoxide integration if zoxide is enabled
  programs.zoxide.enableFishIntegration = if (config.programs.zoxide.enable) then false else config.programs.zoxide.enableFishIntegration;
}
