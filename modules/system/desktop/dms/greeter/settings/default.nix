{ pkgs, ... }:
let
  greeterSettingsDir = pkgs.writeTextDir "settings.json" (builtins.readFile ./settings.json);
in
{
  programs.dank-material-shell.greeter = {
    configFiles = [ "${greeterSettingsDir}/settings.json" ];
  };
}
