{ pkgs, ... }:
{
  # Flatpak runtime. Provides the daemon and xdg-portal integration;
  # individual package installs are declared per-app under
  # home/modules/apps/nixos/<app>/ via the nix-flatpak home-manager
  # module (see home/modules/apps/nixos/flatpak/).
  services.flatpak.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
