{ localLib, host, ... }:
localLib.importModules ./. {
  inherit host;
  # Linux-only: virtualisation.podman.* does not exist on nix-darwin, and
  # containers need a Linux kernel (wsl runs NixOS, so it is included).
  platforms = [
    "nixos"
    "wsl"
  ];
}
