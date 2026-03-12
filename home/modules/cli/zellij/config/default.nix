{
  pkgs,
  localLib,
  zellij-hud,
  ...
}:
let
  baseConfig = localLib.concatConfig {
    inherit pkgs;
    dir = ./.;
    ext = "kdl";
    outName = "zellij-config.kdl";
  };
  hudPath = "${zellij-hud.packages.${pkgs.system}.default}/bin/zellij-hud.wasm";
in
{
  xdg.configFile."zellij/config.kdl".text = builtins.readFile baseConfig + ''
    load_plugins {
      "file:${hudPath}" {
        theme "tokyonight"
      }
    }
  '';
}
