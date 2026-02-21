_: {
  # niri: A scrollable-tiling Wayland compositor
  programs.niri.enable = true;

  # Optional, hint electron apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
