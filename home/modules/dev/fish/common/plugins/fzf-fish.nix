{
  pkgs,
  config,
  lib,
  localLib,
  ...
}:
lib.mkIf config.programs.fzf.enable {
  programs.fish = {
    # install fzf-fish
    plugins = [ (localLib.mkPlugin pkgs.fishPlugins.fzf-fish) ];

    # fzf-fish settings
    interactiveShellInit = ''
      fzf_configure_bindings \
        --history=\cr \
        --directory= \
        --git_log= \
        --git_status= \
        --processes= \
        --variables=
    '';
  };

  # disable fzf integration
  programs.fzf.enableFishIntegration = false;
}
