{ pkgs, ... }:
{
  # Flatpak runtime. Provides the daemon and xdg-portal integration;
  # individual package installs are declared per-app under
  # modules/home/apps/nixos/<app>/ via the nix-flatpak home-manager
  # module (see modules/home/apps/nixos/flatpak/).
  services.flatpak.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
