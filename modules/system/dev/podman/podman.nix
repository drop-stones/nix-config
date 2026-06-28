_: {
  # Podman: rootless, daemonless container engine. Preferred over Docker for
  # sandboxing (containers run as the unprivileged user). docker-compatible,
  # so the docker CLI knowledge and OCI images both carry over.
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true; # provide `docker` as an alias for podman
      defaultNetwork.settings.dns_enabled = true; # container name resolution (aardvark-dns)
    };
  };
}
