{ pkgs, ... }:
{
  # podman-compose: run upstream docker-compose.yml files with podman.
  environment.systemPackages = [ pkgs.podman-compose ];
}
