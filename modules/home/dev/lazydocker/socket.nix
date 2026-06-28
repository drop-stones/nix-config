{ pkgs, ... }:
{
  # Expose podman's docker-compatible API on a rootless, socket-activated user
  # socket so docker-API clients (e.g. lazydocker) can reach podman. The service
  # starts on the first connection and idle-exits afterwards; running containers
  # are unaffected (podman is daemonless).
  #
  # Point docker-API clients at this socket. Harmless globally: the podman/docker
  # CLIs ignore DOCKER_HOST (only API clients like lazydocker use it), so bare
  # `lazydocker` works. As a session variable it takes effect on the next login.
  home.sessionVariables.DOCKER_HOST = "unix://$XDG_RUNTIME_DIR/podman/podman.sock";

  systemd.user = {
    sockets.podman = {
      Unit.Description = "Podman API socket (for docker-API clients like lazydocker)";
      Socket = {
        ListenStream = "%t/podman/podman.sock";
        SocketMode = "0660";
      };
      Install.WantedBy = [ "sockets.target" ];
    };
    services.podman = {
      Unit = {
        Description = "Podman API service";
        Requires = "podman.socket";
        After = "podman.socket";
      };
      Service = {
        Type = "exec";
        KillMode = "process";
        ExecStart = "${pkgs.podman}/bin/podman system service";
      };
    };
  };
}
