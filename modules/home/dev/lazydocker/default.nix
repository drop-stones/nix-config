{ localLib, host, ... }:
localLib.importModules ./. {
  inherit host;
  # Needs the rootless podman socket (systemd user units), which only exists on
  # Linux. darwin runs podman in a VM with a different socket, so skip it there.
  platforms = [
    "nixos"
    "wsl"
  ];
}
