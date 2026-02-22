{ dms, ... }:
{
  # dms-greeter: a greetd greeter using the same aesthetics as the DankMaterialShell lock screen
  imports = [ dms.nixosModules.greeter ];

  programs.dank-material-shell.greeter = {
    enable = true;
    compositor.name = "niri";
  };
}
