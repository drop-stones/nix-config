{ pkgs, ... }:
{
  home.packages = [ pkgs.lazydocker ];

  # DOCKER_HOST (set in socket.nix) already points lazydocker at podman, so this
  # is just a short trigger. `ld` is the GNU linker, hence `lzd`.
  programs.fish.shellAbbrs.lzd = "lazydocker";
}
