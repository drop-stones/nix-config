{ nix-flatpak, ... }:
{
  # Declarative user-level Flatpak management. Individual apps live
  # under sibling directories (e.g. ../bambu-studio/) and extend
  # services.flatpak.packages.
  imports = [ nix-flatpak.homeManagerModules.nix-flatpak ];

  services.flatpak.remotes = [
    {
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }
  ];
}
