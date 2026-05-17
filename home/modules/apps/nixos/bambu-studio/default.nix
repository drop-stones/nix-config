_: {
  # Bambu Studio: slicer for Bambu Lab 3D printers.
  # Installed via Flatpak because the nixpkgs build cannot complete
  # Bambu Cloud login as of nixpkgs 25.11:
  # https://github.com/NixOS/nixpkgs/issues/498307
  services.flatpak.packages = [ "com.bambulab.BambuStudio" ];
}
