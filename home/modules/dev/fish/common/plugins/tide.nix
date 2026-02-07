{
  pkgs,
  lib,
  localLib,
  ...
}:
let
  tideArgs = lib.concatStringsSep " " [
    "--auto"
    "--style=Lean"
    "--prompt_colors='True color'"
    "--show_time=No"
    "--lean_prompt_height='Two lines'"
    "--prompt_connection=Disconnected"
    "--prompt_spacing=Sparse"
    "--icons='Few icons'"
    "--transient=Yes"
  ];
in
{
  # tide: 🌊 The ultimate Fish prompt
  programs.fish.plugins = [ (localLib.mkPlugin pkgs.fishPlugins.tide) ];

  # configure tide after `nixos-rebuild switch`
  home.activation = {
    tideConfigure = lib.hm.dag.entryAfter [ "installPackages" ] ''
      ${pkgs.fish}/bin/fish -lc "tide configure ${tideArgs}" 2>&1 >/dev/null
    '';
  };
}
