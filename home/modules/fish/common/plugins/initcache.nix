{ pkgs, config, lib, localLib, ... }:
{
  programs.fish = {
    # install initcache
    plugins = [ (localLib.mkPlugin pkgs.fishPlugins.initcache) ];

    # settings for zoxide/mise
    interactiveShellInit = ''
      ${lib.optionalString config.programs.zoxide.enable "initcache source zoxide init fish\n"}
      ${lib.optionalString config.programs.mise.enable "initcache source mise activate fish\n"}
    '';
  };

  # disable zoxide integration if zoxide is enabled
  programs.zoxide.enableFishIntegration = if (config.programs.zoxide.enable) then false else config.programs.zoxide.enableFishIntegration;
}
