{ pkgs, config, lib, localLib, ... }:
{
  programs.fish = {
    # install initcache
    plugins = [ (localLib.mkPlugin pkgs.fishPlugins.initcache) ];

    # settings for zoxide/mise
    interactiveShellInit = ''
      ${lib.optionalString config.programs.zoxide.enable "initcache source zoxide init fish"}
      ${lib.optionalString config.programs.mise.enable "initcache source mise activate fish"}
    '';
  };

  # disable zoxide integration if zoxide is enabled
  programs.zoxide.enableFishIntegration = if (config.programs.zoxide.enable) then false else config.programs.zoxide.enableFishIntegration;

  # disable mise integration if mise is enabled
  programs.mise.enableFishIntegration = if (config.programs.mise.enable) then false else config.programs.mise.enableFishIntegration;
}
